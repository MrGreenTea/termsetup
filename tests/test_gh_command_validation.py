#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "pytest",
# ]
# ///

"""
Tests for GitHub CLI command validation.
Tests the validate_gh_command function that determines if gh commands are safe or unsafe.
"""

import sys
from pathlib import Path
import pytest

# Add scripts directory to path to import the validator
sys.path.insert(0, str(Path(__file__).parent.parent / "scripts"))

# Import functions from the validator script
from gh_command_validator import validate_gh_command, SafetyLevel


class TestSafeCommands:
    """Test commands that should return SafetyLevel.SAFE."""

    @pytest.mark.parametrize(
        "command",
        [
            # Authentication & Configuration
            "gh auth status",
            "gh config list",
            # Repository Operations
            "gh repo list",
            "gh repo view owner/repo",
            "gh repo view",
            "gh browse",
            # Issues & Pull Requests
            "gh issue list",
            "gh issue view 123",
            "gh issue view",
            "gh pr list",
            "gh pr view 456",
            "gh pr view",
            # Workflows & Runs
            "gh workflow list",
            "gh workflow view workflow-name",
            "gh workflow view",
            "gh run list",
            "gh run view 789",
            "gh run view",
            # Releases & Labels
            "gh release list",
            "gh release view v1.0.0",
            "gh release view",
            "gh label list",
            # Search Operations
            "gh search repos query",
            "gh search issues bug",
            "gh search prs feature",
            "gh search code function",
            "gh search commits author:user",
            # Secrets & Variables (View Only)
            "gh secret list",
            "gh variable list",
            # Other Safe Commands
            "gh gist list",
            "gh ssh-key list",
            "gh gpg-key list",
            "gh extension list",
            "gh codespace list",
            "gh codespace view name",
            "gh codespace view",
            "gh cache list",
            "gh org list",
            "gh project list",
            "gh project view 123",
            "gh project view",
            "gh ruleset list",
            "gh ruleset view id",
            "gh ruleset view",
        ],
    )
    def test_safe_commands_return_safe(self, command):
        """Test that all documented safe commands return SafetyLevel.SAFE."""
        result = validate_gh_command(command)
        assert result == SafetyLevel.SAFE, (
            f"Command '{command}' should be safe but was marked unsafe"
        )

    @pytest.mark.parametrize(
        "command",
        [
            # Commands with additional arguments/flags
            "gh repo list --limit 10",
            "gh repo view owner/repo --json",
            "gh issue list --state open",
            "gh pr list --author username",
            "gh search repos query --sort stars",
            "gh workflow list --all",
            "gh run view 123 --log",
            "gh release list --limit 5",
            "gh secret list --org myorg",
            # Commands with complex arguments
            "gh search code 'function main' --language python",
            "gh search issues 'bug label:critical' --repo owner/repo",
            "gh repo view owner/repo --web",
        ],
    )
    def test_safe_commands_with_arguments_return_safe(self, command):
        """Test that safe commands with additional arguments return SafetyLevel.SAFE."""
        result = validate_gh_command(command)
        assert result == SafetyLevel.SAFE, (
            f"Command '{command}' should be safe but was marked unsafe"
        )


class TestUnsafeCommands:
    """Test commands that should return SafetyLevel.UNSAFE."""

    @pytest.mark.parametrize(
        "command",
        [
            # Creation commands
            "gh issue create",
            "gh pr create",
            "gh release create",
            "gh repo create",
            "gh gist create",
            "gh secret set",
            "gh variable set",
            "gh codespace create",
            "gh project create",
            # Modification commands
            "gh issue edit 123",
            "gh pr edit 456",
            "gh release edit v1.0.0",
            "gh repo edit",
            "gh issue comment 123",
            "gh pr comment 456",
            "gh pr review 456",
            "gh pr merge 456",
            # Deletion commands
            "gh issue close 123",
            "gh pr close 456",
            "gh repo delete",
            "gh release delete v1.0.0",
            "gh gist delete",
            "gh secret delete",
            "gh variable delete",
            "gh codespace delete",
            # Action commands
            "gh workflow run",
            "gh workflow enable",
            "gh workflow disable",
            "gh run cancel",
            "gh run rerun",
            # Repository management
            "gh repo fork",
            "gh repo clone",
            "gh repo sync",
            # Authentication actions
            "gh auth login",
            "gh auth logout",
            "gh auth refresh",
            # Other unsafe commands
            "gh ssh-key add",
            "gh ssh-key delete",
            "gh gpg-key add",
            "gh gpg-key delete",
            "gh extension install",
            "gh extension remove",
            # Unknown/invalid commands
            "gh unknown command",
            "gh invalid subcommand",
        ],
    )
    def test_unsafe_commands_return_unsafe(self, command):
        """Test that commands with modification/creation/deletion verbs return SafetyLevel.UNSAFE."""
        result = validate_gh_command(command)
        assert result == SafetyLevel.UNSAFE, (
            f"Command '{command}' should be unsafe but was marked safe"
        )

    @pytest.mark.parametrize(
        "command",
        [
            # Unsafe commands with arguments
            "gh issue create --title 'Bug report' --body 'Description'",
            "gh pr create --title 'Feature' --body 'Description' --head branch",
            "gh repo create myrepo --public",
            "gh secret set SECRET_NAME --body value",
            "gh workflow run workflow.yml --ref main",
            "gh pr merge 123 --squash",
            "gh issue close 456 --comment 'Fixed'",
        ],
    )
    def test_unsafe_commands_with_arguments_return_unsafe(self, command):
        """Test that unsafe commands with arguments return SafetyLevel.UNSAFE."""
        result = validate_gh_command(command)
        assert result == SafetyLevel.UNSAFE, (
            f"Command '{command}' should be unsafe but was marked safe"
        )


class TestEdgeCases:
    """Test edge cases and input validation."""

    @pytest.mark.parametrize(
        "command,expected",
        [
            # Case sensitivity - should be UNSAFE for non-lowercase
            ("GH AUTH STATUS", SafetyLevel.UNSAFE),
            ("gh AUTH status", SafetyLevel.UNSAFE),
            ("Gh Repo List", SafetyLevel.UNSAFE),
            ("GH ISSUE CREATE", SafetyLevel.UNSAFE),
            ("gh PR CREATE", SafetyLevel.UNSAFE),
            # Whitespace handling
            ("  gh repo list  ", SafetyLevel.SAFE),
            ("gh  repo  list", SafetyLevel.SAFE),
            ("\tgh\tauth\tstatus\t", SafetyLevel.SAFE),
            ("  gh issue create  ", SafetyLevel.UNSAFE),
            # Incomplete commands
            ("gh", SafetyLevel.UNSAFE),
            ("gh repo", SafetyLevel.UNSAFE),
            ("gh issue", SafetyLevel.UNSAFE),
            ("gh pr", SafetyLevel.UNSAFE),
            # Non-gh commands
            ("git status", SafetyLevel.UNSAFE),
            ("hub issue list", SafetyLevel.UNSAFE),
            ("gh-cli repo list", SafetyLevel.UNSAFE),
            # Empty and invalid inputs
            ("", SafetyLevel.UNSAFE),
            ("   ", SafetyLevel.UNSAFE),
            ("not-a-command", SafetyLevel.UNSAFE),
            ("gh-not-space-separated", SafetyLevel.UNSAFE),
        ],
    )
    def test_edge_cases(self, command, expected):
        """Test various edge cases and input validation scenarios."""
        result = validate_gh_command(command)
        assert result == expected, (
            f"Command '{command}' should return {expected} but returned {result}"
        )

    def test_very_long_command(self):
        """Test validation of very long commands."""
        long_safe_command = "gh repo view " + "a" * 1000
        result = validate_gh_command(long_safe_command)
        assert result == SafetyLevel.SAFE

        long_unsafe_command = "gh repo create " + "a" * 1000
        result = validate_gh_command(long_unsafe_command)
        assert result == SafetyLevel.UNSAFE

    @pytest.mark.parametrize(
        "command",
        [
            # Commands that might be confused with safe ones
            "gh repo list-all",  # Not the same as "gh repo list"
            "gh issue listing",  # Not the same as "gh issue list"
            "gh pr viewer",  # Not the same as "gh pr view"
            # Partial matches that should be unsafe
            "gh repository list",  # "repository" not "repo"
            "gh repos list",  # "repos" not "repo"
            "gh issues list",  # "issues" not "issue"
            "gh prs list",  # "prs" not "pr"
        ],
    )
    def test_partial_and_similar_commands_are_unsafe(self, command):
        """Test that commands similar to but not exactly matching safe commands are unsafe."""
        result = validate_gh_command(command)
        assert result == SafetyLevel.UNSAFE, (
            f"Command '{command}' should be unsafe (not exact match)"
        )


if __name__ == "__main__":
    pytest.main([__file__])
