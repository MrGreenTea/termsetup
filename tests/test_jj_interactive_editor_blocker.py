#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "pytest",
# ]
# ///
# ABOUTME: Tests for jj interactive editor blocker hook
# ABOUTME: Verifies detection of jj commands that would open interactive editors

import sys
from pathlib import Path

import pytest

# Add scripts directory to path to import the hook
sys.path.insert(0, str(Path(__file__).parent.parent / "scripts"))

# Import from the implementation (will be created later)
from jj_interactive_editor_blocker import (
    check_jj_interactive_command,
    CommandCheckResult,
)


class TestSimpleEditorCommands:
    """Test detection of simple commands that open editors without flags."""

    def test_jj_describe_without_message_blocks(self):
        result = check_jj_interactive_command("jj describe")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj describe -m \"message\"' to avoid interactive editor",
        )

    def test_jj_describe_with_short_message_flag_allows(self):
        result = check_jj_interactive_command("jj describe -m 'my message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_long_message_flag_allows(self):
        result = check_jj_interactive_command("jj describe --message 'my message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_double_quoted_message_allows(self):
        result = check_jj_interactive_command('jj describe -m "my message"')
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_equals_message_allows(self):
        result = check_jj_interactive_command('jj describe --message="my message"')
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_without_message_blocks(self):
        result = check_jj_interactive_command("jj commit")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj commit -m \"message\"' to avoid interactive editor",
        )

    def test_jj_commit_with_short_message_flag_allows(self):
        result = check_jj_interactive_command("jj commit -m 'fix bug'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_long_message_flag_allows(self):
        result = check_jj_interactive_command("jj commit --message 'fix bug'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_double_quoted_message_allows(self):
        result = check_jj_interactive_command('jj commit -m "fix bug"')
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_new_without_message_allows(self):
        result = check_jj_interactive_command("jj new")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_new_with_short_message_flag_allows(self):
        result = check_jj_interactive_command("jj new -m 'start feature'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_new_with_long_message_flag_allows(self):
        result = check_jj_interactive_command("jj new --message 'start feature'")
        assert result == CommandCheckResult(decision="allow", reason="safe")


class TestComplexEditorCommands:
    """Test detection of complex commands with special requirements."""

    def test_jj_split_without_filesets_blocks(self):
        result = check_jj_interactive_command("jj split")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj split <filesets> -m \"message\"' to avoid interactive editor",
        )

    def test_jj_split_with_file_but_no_message_blocks(self):
        result = check_jj_interactive_command("jj split file.py")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj split file.py -m \"message\"' to avoid interactive editor",
        )

    def test_jj_split_with_directory_but_no_message_blocks(self):
        result = check_jj_interactive_command("jj split src/")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj split src/ -m \"message\"' to avoid interactive editor",
        )

    def test_jj_split_with_file_and_message_allows(self):
        result = check_jj_interactive_command("jj split file.py -m 'extract function'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_file_and_long_message_flag_allows(self):
        result = check_jj_interactive_command(
            "jj split file.py --message 'extract function'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_message_before_fileset_allows(self):
        result = check_jj_interactive_command("jj split -m 'extract' file.py")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_long_message_before_fileset_allows(self):
        result = check_jj_interactive_command("jj split --message 'extract' file.py")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_directory_and_long_message_flag_allows(self):
        result = check_jj_interactive_command(
            "jj split src/ --message 'extract function'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_without_flags_blocks(self):
        result = check_jj_interactive_command("jj squash")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj squash -m \"message\"' or 'jj squash --use-destination-message' to avoid interactive editor",
        )

    def test_jj_squash_with_short_message_flag_allows(self):
        result = check_jj_interactive_command("jj squash -m 'combine changes'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_long_message_flag_allows(self):
        result = check_jj_interactive_command("jj squash --message 'combine changes'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_use_destination_short_flag_allows(self):
        result = check_jj_interactive_command("jj squash -u")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_use_destination_long_flag_allows(self):
        result = check_jj_interactive_command("jj squash --use-destination-message")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_use_destination_and_revision_allows(self):
        result = check_jj_interactive_command("jj squash -u -r @-")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_long_use_destination_and_revision_allows(self):
        result = check_jj_interactive_command(
            "jj squash --use-destination-message -r @-"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_resolve_without_list_blocks(self):
        result = check_jj_interactive_command("jj resolve")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )

    def test_jj_resolve_with_long_list_flag_allows(self):
        result = check_jj_interactive_command("jj resolve --list")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_resolve_with_short_list_flag_allows(self):
        result = check_jj_interactive_command("jj resolve -l")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_resolve_with_ours_tool_blocks(self):
        result = check_jj_interactive_command("jj resolve --tool :ours")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )

    def test_jj_resolve_with_theirs_tool_blocks(self):
        result = check_jj_interactive_command("jj resolve --tool :theirs")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )

    def test_jj_resolve_with_vimdiff_tool_blocks(self):
        result = check_jj_interactive_command("jj resolve --tool vimdiff")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )

    def test_jj_resolve_with_file_path_blocks(self):
        result = check_jj_interactive_command("jj resolve path/to/file")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )


class TestAlwaysInteractiveCommands:
    """Test commands that always open interactive editors."""

    def test_jj_diffedit_always_blocks(self):
        result = check_jj_interactive_command("jj diffedit")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj restore' or 'jj squash' instead of diffedit",
        )

    def test_jj_diffedit_with_revision_blocks(self):
        result = check_jj_interactive_command("jj diffedit -r @")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj restore' or 'jj squash' instead of diffedit",
        )

    def test_jj_diffedit_with_from_to_blocks(self):
        result = check_jj_interactive_command("jj diffedit --from @ --to @-")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj restore' or 'jj squash' instead of diffedit",
        )

    def test_jj_diffedit_with_tool_blocks(self):
        result = check_jj_interactive_command("jj diffedit --tool sometool")
        assert result == CommandCheckResult(
            decision="block",
            reason="Use 'jj restore' or 'jj squash' instead of diffedit",
        )


class TestInteractiveFlags:
    """Test detection of --interactive and -i flags."""

    def test_jj_squash_with_interactive_long_flag_blocks(self):
        result = check_jj_interactive_command("jj squash --interactive")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_jj_squash_with_interactive_short_flag_blocks(self):
        result = check_jj_interactive_command("jj squash -i")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_jj_split_with_interactive_long_flag_blocks(self):
        result = check_jj_interactive_command("jj split --interactive file.py")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_jj_split_with_interactive_short_flag_blocks(self):
        result = check_jj_interactive_command("jj split -i file.py")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_jj_commit_with_interactive_long_flag_blocks(self):
        result = check_jj_interactive_command("jj commit --interactive")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_jj_commit_with_interactive_short_flag_blocks(self):
        result = check_jj_interactive_command("jj commit -i")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_interactive_flag_overrides_message_flag(self):
        result = check_jj_interactive_command("jj squash -m 'message' --interactive")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()

    def test_interactive_flag_overrides_use_destination_flag(self):
        result = check_jj_interactive_command("jj squash -u -i")
        assert result.decision == "block"
        assert "interactive flag" in result.reason.lower()


class TestNonJjCommands:
    """Test non-jj commands that should always be allowed."""

    def test_git_status_allows(self):
        result = check_jj_interactive_command("git status")
        assert result.decision == "allow"

    def test_ls_command_allows(self):
        result = check_jj_interactive_command("ls -la")
        assert result.decision == "allow"

    def test_echo_command_allows(self):
        result = check_jj_interactive_command("echo 'hello'")
        assert result.decision == "allow"


class TestSafeJjCommands:
    """Test jj commands that don't open editors."""

    def test_jj_status_allows(self):
        result = check_jj_interactive_command("jj status")
        assert result.decision == "allow"

    def test_jj_log_allows(self):
        result = check_jj_interactive_command("jj log")
        assert result.decision == "allow"

    def test_jj_diff_allows(self):
        result = check_jj_interactive_command("jj diff")
        assert result.decision == "allow"

    def test_jj_show_allows(self):
        result = check_jj_interactive_command("jj show")
        assert result.decision == "allow"


class TestCommandsWithRevisions:
    """Test commands with revision specifiers."""

    def test_jj_describe_with_current_revision_and_message_allows(self):
        result = check_jj_interactive_command("jj describe -r @ -m 'message'")
        assert result.decision == "allow"

    def test_jj_describe_with_current_revision_and_long_message_allows(self):
        result = check_jj_interactive_command("jj describe -r @ --message 'message'")
        assert result.decision == "allow"

    def test_jj_describe_with_parent_revision_and_message_allows(self):
        result = check_jj_interactive_command("jj describe -r @- -m 'message'")
        assert result.decision == "allow"

    def test_jj_describe_with_parent_revision_and_long_message_allows(self):
        result = check_jj_interactive_command("jj describe -r @- --message 'message'")
        assert result.decision == "allow"

    def test_jj_commit_with_revision_and_message_allows(self):
        result = check_jj_interactive_command("jj commit -r @ -m 'message'")
        assert result.decision == "allow"

    def test_jj_commit_with_revision_and_long_message_allows(self):
        result = check_jj_interactive_command("jj commit -r @ --message 'message'")
        assert result.decision == "allow"


class TestWhitespaceHandling:
    """Test commands with multiple spaces and formatting."""

    def test_jj_describe_with_extra_spaces_blocks(self):
        result = check_jj_interactive_command("jj  describe")
        assert result.decision == "block"

    def test_jj_describe_with_multiple_spaces_and_message_allows(self):
        result = check_jj_interactive_command("jj   describe  -m  'message'")
        assert result.decision == "allow"

    def test_jj_describe_with_multiple_spaces_and_long_message_allows(self):
        result = check_jj_interactive_command("jj   describe  --message  'message'")
        assert result.decision == "allow"


class TestCommandAliases:
    """Test command aliases if implemented."""

    def test_jj_desc_alias_blocks(self):
        result = check_jj_interactive_command("jj desc")
        assert result.decision == "block"

    def test_jj_desc_alias_with_message_allows(self):
        result = check_jj_interactive_command("jj desc -m 'message'")
        assert result.decision == "allow"

    def test_jj_desc_alias_with_long_message_flag_allows(self):
        result = check_jj_interactive_command("jj desc --message 'message'")
        assert result.decision == "allow"


class TestCommandsWithArguments:
    """Test commands with various argument patterns."""

    def test_jj_describe_with_revision_arg_blocks(self):
        result = check_jj_interactive_command("jj describe @")
        assert result.decision == "block"
        assert "interactive editor" in result.reason

    def test_jj_describe_with_global_repo_flag_blocks(self):
        result = check_jj_interactive_command("jj -R /path/to/repo describe")
        assert result.decision == "block"
        assert "interactive editor" in result.reason

    def test_jj_describe_with_revision_and_message_allows(self):
        result = check_jj_interactive_command("jj describe @ -m 'message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_revision_and_long_message_allows(self):
        result = check_jj_interactive_command("jj describe @ --message 'message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_message_before_revision_allows(self):
        result = check_jj_interactive_command("jj describe -m 'message' @")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_long_message_before_revision_allows(self):
        result = check_jj_interactive_command("jj describe --message 'message' @")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_complex_single_quotes_allows(self):
        result = check_jj_interactive_command("jj commit -m \"message with 'quotes'\"")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_complex_single_quotes_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj commit --message \"message with 'quotes'\""
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_complex_double_quotes_allows(self):
        result = check_jj_interactive_command("jj commit -m 'message with \"quotes\"'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_complex_double_quotes_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj commit --message 'message with \"quotes\"'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_unquoted_single_word_allows(self):
        result = check_jj_interactive_command("jj commit -m message")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_unquoted_single_word_and_long_message_allows(self):
        result = check_jj_interactive_command("jj commit --message message")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_multiple_files_and_message_allows(self):
        result = check_jj_interactive_command(
            "jj split file1.py file2.py -m 'split files'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_multiple_files_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj split file1.py file2.py --message 'split files'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_multiple_directories_and_message_allows(self):
        result = check_jj_interactive_command("jj split src/ tests/ -m 'split dirs'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_multiple_directories_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj split src/ tests/ --message 'split dirs'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_no_pager_flag_and_message_allows(self):
        result = check_jj_interactive_command("jj --no-pager describe -m 'message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_no_pager_flag_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj --no-pager describe --message 'message'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_color_flag_and_message_allows(self):
        result = check_jj_interactive_command("jj --color=always commit -m 'message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_color_flag_and_long_message_allows(self):
        result = check_jj_interactive_command(
            "jj --color=always commit --message 'message'"
        )
        assert result == CommandCheckResult(decision="allow", reason="safe")


class TestHelpFlags:
    """Test that --help and -h flags are always allowed for all jj commands."""

    def test_jj_describe_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj describe --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj commit --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj split --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj squash --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_resolve_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj resolve --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_diffedit_with_help_flag_allows(self):
        result = check_jj_interactive_command("jj diffedit --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_with_short_help_flag_allows(self):
        result = check_jj_interactive_command("jj describe -h")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_short_help_flag_allows(self):
        result = check_jj_interactive_command("jj commit -h")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_diffedit_with_short_help_flag_allows(self):
        result = check_jj_interactive_command("jj diffedit -h")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_describe_help_with_other_args_allows(self):
        result = check_jj_interactive_command("jj describe --help @")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_help_with_message_allows(self):
        result = check_jj_interactive_command("jj commit --help -m 'message'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_split_help_with_files_allows(self):
        result = check_jj_interactive_command("jj split --help file.py")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_global_help_allows(self):
        result = check_jj_interactive_command("jj --help describe")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_help_in_commit_message_without_message_flag_blocks(self):
        result = check_jj_interactive_command("jj describe")
        assert result.decision == "block"
        assert "interactive editor" in result.reason

    def test_jj_help_in_commit_message_with_message_flag_allows(self):
        result = check_jj_interactive_command("jj describe -m 'need --help with this'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_help_in_message_allows(self):
        result = check_jj_interactive_command("jj commit -m 'use --help flag'")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_squash_with_help_and_interactive_flag_allows(self):
        result = check_jj_interactive_command("jj squash --help -i")
        assert result == CommandCheckResult(decision="allow", reason="safe")

    def test_jj_commit_with_interactive_and_help_flag_allows(self):
        result = check_jj_interactive_command("jj commit -i --help")
        assert result == CommandCheckResult(decision="allow", reason="safe")


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
