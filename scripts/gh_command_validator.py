# ABOUTME: GitHub CLI command safety classifier using enum-based detection
# ABOUTME: Determines if gh commands are safe (read-only) or unsafe (modifying)

import shlex
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


def validate_gh_command(command_string: str) -> SafetyLevel:
    """Return SAFE if GitHub CLI command is read-only, UNSAFE otherwise.

    Args:
        command_string: The complete command string (e.g., "gh repo list")

    Returns:
        GhCommandSafety.SAFE if command is read-only, GhCommandSafety.UNSAFE otherwise
    """
    try:
        tokens = shlex.split(command_string)
    except ValueError:
        # Invalid shell syntax
        return SafetyLevel.UNSAFE

    # Must start with 'gh'
    if not tokens or tokens[0] != "gh":
        return SafetyLevel.UNSAFE

    # Extract command parts (everything after 'gh')
    command_parts = tuple(tokens[1:])

    # Check if command parts match any safe command pattern
    # We check if the command starts with any of our safe patterns
    for safe_pattern in SAFE_GH_COMMANDS:
        if len(command_parts) >= len(safe_pattern):
            if command_parts[: len(safe_pattern)] == safe_pattern:
                return SafetyLevel.SAFE

    return SafetyLevel.UNSAFE

