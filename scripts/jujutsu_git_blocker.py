#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Blocks git commands when inside a jujutsu repository
# ABOUTME: Detects jujutsu repos using 'jj workspace root' and suggests jj alternatives

import json
import subprocess
import sys


def is_in_jujutsu_repo():
    """Check if current directory is inside a jujutsu repository"""
    try:
        result = subprocess.run(
            ["jj", "workspace", "root"],
            capture_output=True,
            text=True,
            timeout=2
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


def get_jj_suggestion(git_command):
    """Return suggested jj command for common git operations"""
    suggestions = {
        "git status": "jj status",
        "git log": "jj log",
        "git show": "jj show",
        "git diff": "jj diff",
        "git add": "jj commit (jujutsu automatically tracks changes)", 
        "git commit": "jj commit",
        "git push": "jj git push",
        "git pull": "jj git fetch",
        "git checkout": "jj new or jj edit",
        "git branch": "jj bookmark list",
        "git merge": "jj rebase",
        "git rebase": "jj rebase",
    }
    
    # Check for exact matches first
    for git_cmd, jj_cmd in suggestions.items():
        if git_command.strip().startswith(git_cmd):
            return jj_cmd
    
    # Default suggestion for any git command
    return "jj help (for jujutsu equivalent)"


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    tool_name = input_data.get("tool_name", "")
    tool_input = input_data.get("tool_input", {})
    command = tool_input.get("command", "")

    if tool_name != "Bash" or not command:
        return 0

    # Check if command starts with git
    if not command.strip().startswith("git "):
        return 0

    # Check if we're in a jujutsu repository
    if not is_in_jujutsu_repo():
        return 0

    # We're in a jujutsu repo and trying to use git - block it
    suggestion = get_jj_suggestion(command)
    response = {
        "decision": "block",
        "reason": f"Git commands are not allowed in jujutsu repositories. Use '{suggestion}' instead.",
    }
    print(json.dumps(response))
    return 2


if __name__ == "__main__":
    sys.exit(main())