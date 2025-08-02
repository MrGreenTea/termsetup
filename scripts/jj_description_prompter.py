#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Hook to prompt Claude to add a description when current change has none
# ABOUTME: Runs after Write/Edit/MultiEdit tools to ensure changes are properly described

import json
import subprocess
import sys


def is_in_jujutsu_repo() -> bool:
    """Check if current directory is inside a jujutsu repository"""
    try:
        subprocess.check_call(["jj", "workspace", "root"], timeout=2)
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False
    else:
        return True


def check_has_description() -> bool:
    """Check if current change has a description"""
    output = subprocess.check_output(
        [
            "jj",
            "log",
            "-r",
            "@",
            "-T",
            "description",
        ],
        text=True,
        timeout=2,
    )
    description = output.strip()
    return bool(description)


def check_has_changes() -> bool:
    """Check if current change has any modifications"""
    output = subprocess.check_output(
        [
            "jj",
            "diff",
            "--name-only",
        ],
        text=True,
        timeout=2,
    )
    return bool(output.strip())


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Get the hook event name from input
    hook_event_name = input_data.get("hook_event_name")

    # Nothing to do
    if hook_event_name != "PostToolUse":
        print("Expected PostToolUse hook event, got", hook_event_name)
        return 1

    if not is_in_jujutsu_repo():
        return 0

    # Only prompt if the current change has modifications and no description
    if check_has_changes() and not check_has_description():
        # Prompt Claude to add a description
        reminder_message = """
Add a description to your current change ith:
`jj commit --message "description"`

To track changes and why they were made."""

        response = {
            "decision": "block",
            "reason": f"<system-reminder>{reminder_message}</system-reminder>",
        }
        print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
