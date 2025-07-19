#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Generic hook script to block specific commands and suggest alternatives
# ABOUTME: Takes blocked command pattern and suggested replacement as arguments

import json
import sys


def main():
    if len(sys.argv) != 3:
        return 1

    blocked_command = sys.argv[1]
    suggested_replacement = sys.argv[2]

    try:
        # Read JSON data from stdin
        input_data = json.load(sys.stdin)
        print(json.dumps(input_data), file=sys.stderr)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    try:
        tool_input = input_data.get("tool_input", {})
        command = tool_input["command"]
    except KeyError:
        # If we can't parse the input data, just continue
        return
    # Check if command starts with the blocked pattern
    if command.strip().startswith(blocked_command):
        response = {
            "decision": "block",
            "reason": f"{blocked_command} is not allowed. Use '{suggested_replacement}' instead.",
        }
        print(json.dumps(response))
        return 2


if __name__ == "__main__":
    sys.exit(main())
