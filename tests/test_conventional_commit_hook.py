#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "pytest",
#     "click"
# ]
# ///

"""
Tests for conventional_commit_hook.py
"""

import sys
import json
import subprocess
from pathlib import Path
import pytest

# Add scripts directory to path to import the hook
sys.path.insert(0, str(Path(__file__).parent.parent / "scripts"))

# Import functions from the hook script
from conventional_commit_hook import (
    extract_commit_description,
    generate_commit_message,
    analyze_git_changes,
)


class TestExtractCommitDescription:
    """Test commit description extraction from diff content."""

    @pytest.mark.parametrize(
        "diff_content,commit_type,expected",
        [
            # Function detection
            ("+def test_function():", "feat", "add test_function function"),
            ("+def fix_bug():", "fix", "fix fix_bug function"),
            ("+def refactor_code():", "refactor", "refactor refactor_code function"),
            # Class detection
            ("+class TestClass:", "feat", "add TestClass class"),
            ("+class Parser:", "fix", "fix Parser class"),
            # Comment detection
            ("+# Add new feature for users", "feat", "add new feature for users"),
            ("+// Fix memory leak issue", "fix", "fix memory leak issue"),
            # Generic fallbacks
            ("random changes", "feat", "add new feature"),
            ("random changes", "fix", "fix bug"),
            ("random changes", "docs", "update documentation"),
        ],
    )
    def test_description_extraction(self, diff_content, commit_type, expected):
        result = extract_commit_description(diff_content, commit_type)
        assert result == expected


class TestGenerateCommitMessage:
    """Test commit message generation."""

    @pytest.mark.parametrize(
        "commit_type,staged_files,diff_content,expected",
        [
            # Single directory scope
            (
                "feat",
                ["src/utils.py"],
                "+def new_func():",
                "feat(src): add new_func function",
            ),
            (
                "fix",
                ["tests/test_utils.py"],
                "+def test_fix():",
                "fix(tests): fix test_fix function",
            ),  # Fix uses "fix" not "add"
            # No scope (root files)
            (
                "chore",
                ["config.json"],
                None,
                "chore: ",
            ),  # No description when diff_content is None
            # Multiple related directories
            (
                "feat",
                ["src/utils/helper.py", "src/utils/parser.py"],
                "+def parse():",
                "feat(src-utils): add parse function",
            ),
            # Template without description
            (
                "feat",
                ["scripts/hook.py"],
                None,
                "feat(scripts): ",
            ),  # No description when diff_content is None
        ],
    )
    def test_message_generation(
        self, commit_type, staged_files, diff_content, expected
    ):
        result = generate_commit_message(commit_type, staged_files, diff_content)
        assert result == expected


class TestAnalyzeGitChangesPatterns:
    """Test commit type detection patterns."""

    @pytest.mark.parametrize(
        "diff_content,staged_files,expected_type",
        [
            # Action verb detection
            ("+def add_feature():", ["src/app.py"], "feat"),
            ("+def fix_issue():", ["src/app.py"], "fix"),
            ("+def refactor_code():", ["src/app.py"], "refactor"),
            # File-based detection
            ("random content", ["README.md"], "docs"),
            ("random content", ["test_app.py"], "test"),
            ("random content", ["config.json"], "chore"),
            # General pattern detection
            ("fix bug in parser", ["src/parser.py"], "fix"),
            ("refactor old code", ["src/old.py"], "refactor"),
            ("improve performance", ["src/fast.py"], "perf"),
            # File with "test" in variable name triggers test type detection
            ("+    new_variable = 'test'", ["src/new.py"], "test"),
        ],
    )
    def test_type_detection_patterns(self, diff_content, staged_files, expected_type):
        # Mock the git commands by creating a simple test
        # Note: This doesn't actually call git, just tests the logic
        import conventional_commit_hook

        # Save original function
        original_run = subprocess.run

        def mock_run(cmd, **kwargs):
            if "diff" in cmd and "--cached" in cmd and "--name-only" in cmd:
                # Mock staged files
                class MockResult:
                    stdout = "\n".join(staged_files)
                    returncode = 0

                return MockResult()
            elif "diff" in cmd and "--cached" in cmd:
                # Mock diff content
                class MockResult:
                    stdout = diff_content
                    returncode = 0

                return MockResult()
            else:
                return original_run(cmd, **kwargs)

        # Temporarily replace subprocess.run
        conventional_commit_hook.subprocess.run = mock_run

        try:
            commit_type, files, content = analyze_git_changes()
            assert commit_type == expected_type
        finally:
            # Restore original function
            conventional_commit_hook.subprocess.run = original_run


class TestHookIntegration:
    """Integration tests using real git repositories."""

    def test_hook_script_execution(self, tmp_path):
        """Test hook execution with subprocess to avoid import issues."""
        # Create a git repo
        subprocess.run(["git", "init"], cwd=tmp_path, check=True, capture_output=True)
        subprocess.run(
            ["git", "config", "user.email", "test@example.com"],
            cwd=tmp_path,
            check=True,
        )
        subprocess.run(
            ["git", "config", "user.name", "Test User"], cwd=tmp_path, check=True
        )

        # Create and stage a file
        test_file = tmp_path / "src" / "utils.py"
        test_file.parent.mkdir(parents=True)
        test_file.write_text("def add_feature():\n    pass\n")

        subprocess.run(["git", "add", "src/utils.py"], cwd=tmp_path, check=True)

        # Test the hook by running it as a subprocess
        hook_path = (
            Path(__file__).parent.parent / "scripts" / "conventional_commit_hook.py"
        )

        result = subprocess.run(
            [str(hook_path)], input="{}", text=True, capture_output=True, cwd=tmp_path
        )

        # Should contain decision JSON in stdout
        assert result.returncode == 0
        assert "decision" in result.stdout
        assert "block" in result.stdout
        # Should suggest feat type and src scope
        assert "feat(src)" in result.stderr or "feat(src)" in result.stdout

    def test_hook_loop_prevention(self, tmp_path):
        """Test that hook allows stopping when stop_hook_active is true."""
        hook_path = (
            Path(__file__).parent.parent / "scripts" / "conventional_commit_hook.py"
        )

        result = subprocess.run(
            [str(hook_path)],
            input='{"stop_hook_active": true}',
            text=True,
            capture_output=True,
            cwd=tmp_path,
        )

        # Should return 0 and produce no output when loop prevention is active
        assert result.returncode == 0
        assert result.stdout == ""

    def test_hook_outside_git_repo(self, tmp_path):
        """Test hook behavior outside a git repository."""
        hook_path = (
            Path(__file__).parent.parent / "scripts" / "conventional_commit_hook.py"
        )

        result = subprocess.run(
            [str(hook_path)],
            input="{}",
            text=True,
            capture_output=True,
            cwd=tmp_path,  # Non-git directory
        )

        # Should return 0 and produce no output when not in git repo
        assert result.returncode == 0
        assert result.stdout == ""


if __name__ == "__main__":
    pytest.main([__file__])
