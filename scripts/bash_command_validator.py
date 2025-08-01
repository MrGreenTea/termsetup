#!/usr/bin/env python3
# ABOUTME: Validates bash commands and suggests better alternatives for Claude Code
# ABOUTME: Implements JSON-based hook for PreToolUse Bash command validation

import json
import re
import sys

# Define validation rules as a list of (regex pattern, message) tuples
VALIDATION_RULES = [
    (
        r"\bgrep\b(?!.*\|)",
        "Use 'rg' (ripgrep) instead of 'grep' for better performance and features",
    ),
    (
        r"\bfind\s+\S+\s+-name\b",
        "Use 'rg --files | rg pattern' or 'rg --files -g pattern' instead of 'find -name' for better performance",
    ),
    (
        r"\bsed\s+(-i|--in-place)\b",
        "Use the Edit tool instead of 'sed -i' for file modifications",
    ),
    (
        r"&\s*$",
        "Background processes (&) are not supported in Claude Code and will cause hanging",
    ),
    (
        r"\bgit\s+add\s+(\.(\s|$)|--all|-A|\S*[*?[\]]\S*)",
        "Use 'git add' with specific file paths instead of glob patterns (., *, --all, -A, etc.) to avoid staging unwanted files",
    ),
]


def validate_command(command: str) -> list[str]:
    issues = []
    for pattern, message in VALIDATION_RULES:
        if re.search(pattern, command):
            issues.append(message)
    return issues


try:
    input_data = json.load(sys.stdin)
except json.JSONDecodeError as e:
    print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
    sys.exit(1)

tool_name = input_data.get("tool_name", "")
tool_input = input_data.get("tool_input", {})
command = tool_input.get("command", "")

if tool_name != "Bash" or not command:
    sys.exit(1)

# Validate the command
issues = validate_command(command)

if issues:
    for message in issues:
        print(f"• {message}", file=sys.stderr)
    # Exit code 2 blocks tool call and shows stderr to Claude
    sys.exit(2)
