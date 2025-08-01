#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Detects jujutsu repositories and adds context to Claude prompts
# ABOUTME: Informs Claude to use jj commands instead of git when in jujutsu repos

import json
import subprocess
import sys

JUJUTSU_CONTEXT = """You are in a jujutsu repository. ALWAYS use jj commands. NEVER use git commands.

When using the gh CLI in jujutsu repositories:
- Always provide the `--repo` flag to specify the repository since gh cannot auto-detect from jj repos
- Use `--head` flag to specify which commit you want to reference
- Example: `gh pr create --repo owner/repo --head jb/my-new-feature`"""


def is_in_jujutsu_repo():
    """Check if current directory is inside a jujutsu repository"""
    try:
        result = subprocess.run(
            ["jj", "workspace", "root"], capture_output=True, text=True, timeout=2
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Check if we're in a jujutsu repository
    if is_in_jujutsu_repo():
        # Add context to inform Claude about jujutsu repository
        response = {
            "hookSpecificOutput": {
                "hookEventName": "UserPromptSubmit",
                "additionalContext": JUJUTSU_CONTEXT,
            }
        }
        print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
