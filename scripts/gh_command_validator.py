#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: GitHub CLI command safety classifier using enum-based detection
# ABOUTME: Determines if gh commands are safe (read-only) or unsafe (modifying)

import json
import shlex
import sys
from enum import Enum
from typing import Set, Tuple


class SafetyLevel(Enum):
    SAFE = "safe"
    UNSAFE = "unsafe"


# Whitelist of safe GitHub CLI commands (read-only operations)
SAFE_GH_COMMANDS: Set[Tuple[str, ...]] = {
    # Authentication & Configuration
    ("auth", "status"),
    ("config", "list"),
    # Repository Operations
    ("repo", "list"),
    ("repo", "view"),
    ("browse",),
    # Issues & Pull Requests
    ("issue", "list"),
    ("issue", "view"),
    ("pr", "list"),
    ("pr", "view"),
    # Workflows & Runs
    ("workflow", "list"),
    ("workflow", "view"),
    ("run", "list"),
    ("run", "view"),
    # Releases & Labels
    ("release", "list"),
    ("release", "view"),
    ("label", "list"),
    # Search Operations
    ("search", "repos"),
    ("search", "issues"),
    ("search", "prs"),
    ("search", "code"),
    ("search", "commits"),
    # Secrets & Variables (View Only)
    ("secret", "list"),
    ("variable", "list"),
    # Other Safe Commands
    ("help",),
    ("gist", "list"),
    ("ssh-key", "list"),
    ("gpg-key", "list"),
    ("extension", "list"),
    ("codespace", "list"),
    ("codespace", "view"),
    ("cache", "list"),
    ("org", "list"),
    ("project", "list"),
    ("project", "view"),
    ("ruleset", "list"),
    ("ruleset", "view"),
}


def classify_gh_command(command_string: str) -> SafetyLevel:
    """Return SAFE if GitHub CLI command is read-only, UNSAFE otherwise.

    Args:
        command_string: The complete command string (e.g., "gh repo list")

    Returns:
        SafetyLevel.SAFE if command is read-only, SafetyLevel.UNSAFE otherwise
    """
    try:
        tokens = shlex.split(command_string)
    except ValueError:
        # Invalid shell syntax
        return SafetyLevel.UNSAFE

    # Must start with 'gh'
    if not tokens or tokens[0] != "gh":
        return SafetyLevel.UNSAFE

    # Any command with --help flag is safe
    if "--help" in tokens:
        return SafetyLevel.SAFE

    # Extract command parts (everything after 'gh')
    command_parts = tuple(tokens[1:])

    # Check if command parts match any safe command pattern
    # We check if the command starts with any of our safe patterns
    for safe_pattern in SAFE_GH_COMMANDS:
        if len(command_parts) >= len(safe_pattern):
            if command_parts[: len(safe_pattern)] == safe_pattern:
                return SafetyLevel.SAFE

    return SafetyLevel.UNSAFE


if __name__ == "__main__":
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        sys.exit(1)

    tool_name = input_data.get("tool_name", "")
    tool_input = input_data.get("tool_input", {})
    command = tool_input.get("command", "")

    if tool_name != "Bash" or not command:
        sys.exit(0)

    # Only check gh commands
    if not command.strip().startswith("gh "):
        sys.exit(0)

    # Check safety and output JSON decision
    if classify_gh_command(command) == SafetyLevel.UNSAFE:
        # Unsafe command - defer to user for approval
        response = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "ask",
                "permissionDecisionReason": f"Unsafe GitHub CLI command detected: {command}",
            }
        }
        print(json.dumps(response))
        sys.exit(0)

    # Safe command - approve to bypass permission system
    response = {
        "hookSpecificOutput": {
            "hookEventName": "PreToolUse",
            "permissionDecision": "allow",
            "permissionDecisionReason": "Safe GitHub CLI command",
        }
    }
    print(json.dumps(response))
    sys.exit(0)
