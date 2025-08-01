#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Lightweight jujutsu detector for user prompts - provides minimal context
# ABOUTME: Runs quickly on every user prompt with just status and commit handling

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


def is_on_current_commit():
    """Check if we're on a current commit (not empty with no description)"""
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
                # We're on a "current" commit if it's non-empty OR has a description
                return not is_empty or has_description
        return False
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def handle_uncommitted_work():
    """Handle the case where we're not on a current commit"""
    try:
        # Create a new commit
        result = subprocess.run(
            ["jj", "new"], capture_output=True, text=True, timeout=5
        )
        if result.returncode != 0:
            return f"Failed to create new commit: {result.stderr}"

        # Return instruction for Claude to describe the work
        return 'Created new commit. Please describe your work using: jj describe --message "your description here"'
    except (subprocess.TimeoutExpired, FileNotFoundError) as e:
        return f"Error handling uncommitted work: {e}"


def get_jj_status():
    """Get jj status output"""
    try:
        result = subprocess.run(
            ["jj", "status"], capture_output=True, text=True, timeout=5
        )
        if result.returncode == 0:
            return result.stdout.strip()
        else:
            return "(failed)"
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return "(unavailable)"


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Get the hook event name from input
    hook_event_name = input_data.get("hook_event_name", "UserPromptSubmit")

    # Check if we're in a jujutsu repository
    if is_in_jujutsu_repo():
        additional_messages = []

        # Check if we're on a current commit, if not handle it
        if not is_on_current_commit():
            uncommitted_message = handle_uncommitted_work()
            additional_messages.append(
                f"<commit-status>\n{uncommitted_message}\n</commit-status>"
            )

        # Get current status
        status_output = get_jj_status()
        status_section = f"""<jj-status>
<command>jj status</command>
<output>
{status_output}
</output>
</jj-status>"""

        # Combine context information
        context_parts = [status_section] + additional_messages
        full_context = (
            f"<jujutsu-context>\n{chr(10).join(context_parts)}\n</jujutsu-context>"
        )

        response = {
            "hookSpecificOutput": {
                "hookEventName": hook_event_name,
                "additionalContext": full_context,
            }
        }
        print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
