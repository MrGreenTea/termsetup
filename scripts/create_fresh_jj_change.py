#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Hook to create a fresh jj change when editing files if current change is empty with no description
# ABOUTME: Runs before Write/Edit/MultiEdit tools to ensure work is done on a proper change

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


def check_current_change_status():
    """Check if current change is empty and has no description"""
    try:
        result = subprocess.run(
            [
                "jj",
                "log",
                "-r",
                "@",
                "-T",
                'if(empty, "empty", "non-empty") ++ "|" ++ description',
            ],
            capture_output=True,
            text=True,
            timeout=2,
        )
        if result.returncode == 0:
            output = result.stdout.strip()
            # Parse the output: "empty|" or "non-empty|description"
            parts = output.split("|", 1)
            if len(parts) >= 2:
                is_empty = parts[0] == "empty"
                has_description = len(parts[1]) > 0
                # Need fresh change if it's empty AND has no description
                return is_empty and not has_description
        return False
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def create_fresh_change():
    """Create a new jj change"""
    try:
        result = subprocess.run(
            ["jj", "new"], capture_output=True, text=True, timeout=5
        )
        return result.returncode == 0, result.stderr if result.returncode != 0 else ""
    except (subprocess.TimeoutExpired, FileNotFoundError) as e:
        return False, str(e)


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        response = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "deny",
                "permissionDecisionReason": f"Invalid JSON input: {e}",
            }
        }
        print(json.dumps(response))
        return 1

    # Only run if we're in a jujutsu repository
    if not is_in_jujutsu_repo():
        response = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "allow",
                "permissionDecisionReason": "Not in jujutsu repository",
            }
        }
        print(json.dumps(response))
        return 0

    # Check if we need to create a fresh change
    if check_current_change_status():
        success, error_msg = create_fresh_change()
        if success:
            response = {
                "hookSpecificOutput": {
                    "hookEventName": "PreToolUse",
                    "permissionDecision": "allow",
                    "permissionDecisionReason": "Created fresh jj change for file modifications",
                }
            }
        else:
            response = {
                "hookSpecificOutput": {
                    "hookEventName": "PreToolUse",
                    "permissionDecision": "deny",
                    "permissionDecisionReason": f"Failed to create fresh jj change: {error_msg}",
                }
            }
    else:
        # Current change is fine (either non-empty or has description)
        response = {
            "hookSpecificOutput": {
                "hookEventName": "PreToolUse",
                "permissionDecision": "allow",
                "permissionDecisionReason": "Current jj change is suitable for modifications",
            }
        }

    print(json.dumps(response))
    return 0


if __name__ == "__main__":
    sys.exit(main())
