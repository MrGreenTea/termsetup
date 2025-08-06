#!/usr/bin/env python3
# ABOUTME: Tracks directory changes when cd is used with the Bash tool
# ABOUTME: Prints current working directory in XML format after cd commands

import json
import shlex
import subprocess
import sys


def has_cd_command(command: str) -> bool:
    """Check if command contains cd using shlex.split"""
    try:
        tokens = shlex.split(command)
        return "cd" in tokens
    except ValueError:
        # If shlex.split fails, fall back to simple check
        return "cd" in command.split()


def get_current_directory() -> str:
    """Get current working directory using pwd"""
    try:
        result = subprocess.run(["pwd"], capture_output=True, text=True, timeout=2)
        if result.returncode == 0:
            return result.stdout.strip()
    except (subprocess.TimeoutExpired, FileNotFoundError):
        pass

    # Fallback to environment
    import os

    return os.getcwd()


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Check if this is the right hook event
    hook_event_name = input_data.get("hook_event_name")
    if hook_event_name != "PostToolUse":
        return 0

    # Only process Bash tool calls
    tool_name = input_data.get("tool_name", "")
    if tool_name != "Bash":
        return 0

    # Get the command that was executed
    tool_input = input_data.get("tool_input", {})
    command = tool_input.get("command", "")

    # Check if command contains cd
    if not has_cd_command(command):
        return 0

    # Get current working directory and create response
    cwd = get_current_directory()
    message = f"Working directory changed to {cwd}"
    
    response = {
        "decision": "block",
        "reason": message
    }
    print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
