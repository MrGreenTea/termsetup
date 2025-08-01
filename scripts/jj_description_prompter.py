#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Hook to prompt Claude to add a description when current change has none
# ABOUTME: Runs after Write/Edit/MultiEdit tools to ensure changes are properly described

import json
import subprocess
import sys


def is_in_jujutsu_repo():
    """Check if current directory is inside a jujutsu repository"""
    try:
        result = subprocess.run(
            ["jj", "workspace", "root"], capture_output=True, text=True, timeout=2
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def check_has_description():
    """Check if current change has a description"""
    try:
        result = subprocess.run(
            [
                "jj",
                "log",
                "-r",
                "@",
                "-T",
                "description",
            ],
            capture_output=True,
            text=True,
            timeout=2,
        )
        if result.returncode == 0:
            description = result.stdout.strip()
            return len(description) > 0
        return False
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def check_has_changes():
    """Check if current change has any modifications"""
    try:
        result = subprocess.run(
            [
                "jj",
                "log",
                "-r",
                "@",
                "-T",
                'if(empty, "empty", "non-empty")',
            ],
            capture_output=True,
            text=True,
            timeout=2,
        )
        if result.returncode == 0:
            output = result.stdout.strip()
            return output == "non-empty"
        return False
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Get the hook event name from input
    hook_event_name = input_data.get("hook_event_name", "PostToolUse")

    # Only run if we're in a jujutsu repository
    if not is_in_jujutsu_repo():
        response = {
            "hookSpecificOutput": {
                "hookEventName": hook_event_name,
            }
        }
        print(json.dumps(response))
        return 0

    # Only prompt if the current change has modifications and no description
    if check_has_changes() and not check_has_description():
        # Prompt Claude to add a description
        reminder_message = """
Please add a description to your current change using:
`jj commit --message "your description here"`

This helps track what changes were made and why."""

        response = {
            "hookSpecificOutput": {
                "hookEventName": hook_event_name,
                "additionalContext": f"<system-reminder>{reminder_message}</system-reminder>"
            }
        }
    else:
        # Change is empty or already has a description - no prompt needed
        response = {
            "hookSpecificOutput": {
                "hookEventName": hook_event_name,
            }
        }

    print(json.dumps(response))
    return 0


if __name__ == "__main__":
    sys.exit(main())