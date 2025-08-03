#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Blocks jj interactive commands that would open editors, suggests alternatives
# ABOUTME: Can be used as importable module or as Claude Code PreToolUse hook

import json
import shlex
import sys
from dataclasses import dataclass
from typing import Literal, Optional


@dataclass()
class CommandCheckResult:
    decision: Literal["allow", "block", "ask"]
    reason: Optional[str]


def check_jj_interactive_command(command: str) -> CommandCheckResult:
    try:
        # Parse command with proper quote handling
        args = shlex.split(command)
    except ValueError:
        # If command can't be parsed, allow it to avoid blocking valid commands
        return CommandCheckResult(decision="allow", reason="safe")

    if not args:
        return CommandCheckResult(decision="allow", reason="safe")

    # Find the 'jj' command in the args (could be after global flags)
    jj_index = None
    for i, arg in enumerate(args):
        if arg == "jj":
            jj_index = i
            break

    # If not a jj command, allow it
    if jj_index is None:
        return CommandCheckResult(decision="allow", reason="safe")

    # Extract jj subcommand and remaining args
    jj_args = args[jj_index + 1 :]
    if not jj_args:
        return CommandCheckResult(decision="allow", reason="safe")

    # Skip global jj flags to find the actual subcommand
    subcommand_index = 0
    while subcommand_index < len(jj_args) and jj_args[subcommand_index].startswith("-"):
        # Skip flag and its value if it takes one
        if jj_args[subcommand_index] in [
            "-R",
            "--repository",
            "--color",
        ] and subcommand_index + 1 < len(jj_args):
            subcommand_index += 2
        elif "=" in jj_args[subcommand_index]:
            subcommand_index += 1
        else:
            subcommand_index += 1

    if subcommand_index >= len(jj_args):
        return CommandCheckResult(decision="allow", reason="safe")

    subcommand = jj_args[subcommand_index]
    remaining_args = jj_args[subcommand_index + 1 :]

    # Handle command aliases
    command_aliases = {"desc": "describe"}
    subcommand = command_aliases.get(subcommand, subcommand)

    # Check for help flags first - help commands never open editors
    all_args = jj_args  # All args after 'jj'
    if "--help" in all_args or "-h" in all_args:
        return CommandCheckResult(decision="allow", reason="safe")

    # Check for interactive flags - these always block regardless of other flags
    all_flags = jj_args[subcommand_index + 1 :]  # All args after subcommand
    if "-i" in all_flags or "--interactive" in all_flags:
        return CommandCheckResult(
            decision="block",
            reason="Cannot use interactive flag - interactive editor will open",
        )

    # Safe commands that never open editors
    safe_commands = {"status", "log", "diff", "show", "new"}
    if subcommand in safe_commands:
        return CommandCheckResult(decision="allow", reason="safe")

    # Commands that always open editors
    if subcommand == "diffedit":
        return CommandCheckResult(
            decision="block",
            reason="Use 'jj restore' or 'jj squash' instead of diffedit",
        )

    # Commands that need message flags
    if subcommand in ["describe", "commit"]:
        return _check_message_command(subcommand, remaining_args)

    # Complex commands
    if subcommand == "split":
        return _check_split_command(remaining_args)

    if subcommand == "squash":
        return _check_squash_command(remaining_args)

    if subcommand == "resolve":
        return _check_resolve_command(remaining_args)

    # Unknown commands - allow by default to avoid blocking valid commands
    return CommandCheckResult(decision="allow", reason="safe")


def _has_message_flag(args: list[str]) -> bool:
    """Check if args contain -m/--message flags with values."""
    i = 0
    while i < len(args):
        arg = args[i]
        if arg == "-m" or arg == "--message":
            # Check if there's a value after the flag
            return i + 1 < len(args)
        elif arg.startswith("--message="):
            # --message=value format
            return len(arg) > len("--message=")
        i += 1
    return False


def _check_message_command(subcommand: str, args: list[str]) -> CommandCheckResult:
    """Check describe/commit commands that need message flags."""
    if _has_message_flag(args):
        return CommandCheckResult(decision="allow", reason="safe")
    else:
        return CommandCheckResult(
            decision="block",
            reason=f"Use 'jj {subcommand} -m \"message\"' to avoid interactive editor",
        )


def _check_split_command(args: list[str]) -> CommandCheckResult:
    """Check split command - needs filesets AND message."""
    has_message = _has_message_flag(args)

    # Check for filesets (non-flag arguments)
    filesets = []
    i = 0
    while i < len(args):
        arg = args[i]
        if not arg.startswith("-"):
            filesets.append(arg)
            i += 1
        elif arg in ["-m", "--message", "-r", "--revision"]:
            # Skip flag and its value
            i += 2 if i + 1 < len(args) else i + 1
        elif "=" in arg:
            # Skip flag=value format
            i += 1
        else:
            # Skip other flags
            i += 1

    if not filesets:
        return CommandCheckResult(
            decision="block",
            reason="Use 'jj split <filesets> -m \"message\"' to avoid interactive editor",
        )

    if not has_message:
        # Build suggestion with the filesets found
        filesets_str = " ".join(filesets)
        return CommandCheckResult(
            decision="block",
            reason=f"Use 'jj split {
                filesets_str
            } -m \"message\"' to avoid interactive editor",
        )

    return CommandCheckResult(decision="allow", reason="safe")


def _check_squash_command(args: list[str]) -> CommandCheckResult:
    """Check squash command - needs message OR -u flag."""
    has_message = _has_message_flag(args)
    has_use_destination = "-u" in args or "--use-destination-message" in args

    if has_message or has_use_destination:
        return CommandCheckResult(decision="allow", reason="safe")
    else:
        return CommandCheckResult(
            decision="block",
            reason="Use 'jj squash -m \"message\"' or 'jj squash --use-destination-message' to avoid interactive editor",
        )


def _check_resolve_command(args: list[str]) -> CommandCheckResult:
    """Check resolve command - only allow with --list flag."""
    has_list = "-l" in args or "--list" in args

    if has_list:
        return CommandCheckResult(decision="allow", reason="safe")
    else:
        return CommandCheckResult(
            decision="block",
            reason="Use 'jj resolve --list' to list conflicts without opening editor",
        )


def main():
    """Main function for Claude Code PreToolUse hook."""
    try:
        # Read JSON data from stdin
        input_data = json.load(sys.stdin)
    except (json.JSONDecodeError, Exception):
        # Silent failure on parsing errors
        return 0

    # Fast circuit for non-Bash tools
    tool_name = input_data.get("tool_name", "")
    if tool_name != "Bash":
        return 0

    # Extract command from tool input
    tool_input = input_data.get("tool_input", {})
    command = tool_input.get("command", "")

    # Fast circuit if command doesn't contain jj
    if not command or "jj" not in command:
        return 0

    # Check the jj command
    result = check_jj_interactive_command(command)

    # Only output response if we need to block or ask
    if result.decision != "allow":
        # Map decision to permission decision
        permission_decision = "deny" if result.decision == "block" else result.decision

        response = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": permission_decision,
                "permissionDecisionReason": result.reason,
            }
        }
        print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
