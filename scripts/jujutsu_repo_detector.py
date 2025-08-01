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

<gh-usage>
When using the gh CLI in jujutsu repositories:
- Always provide the `--repo` flag to specify the repository since gh cannot auto-detect from jj repos
- Use `--head` flag to specify which commit you want to reference
- Example: `gh pr create --repo owner/repo --head jb/my-new-feature`
</gh-usage>

<commit-workflow>
When you make changes, use `jj describe --message "description"` to describe your work.
Write clear, concise commit descriptions that explain what you accomplished.
Use conventional commit style: type(scope): description
- Common types: feat, fix, docs, style, refactor, test, chore
- Example: `jj describe --message "feat(jujutsu): add commit status check to detector"`
</commit-workflow>
"""


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


def get_jujutsu_info():
    """Get jujutsu repository information"""
    commands = [
        ("jj-status", "jj status", ["jj", "status"]),
        ("jj-remotes", "jj git remote list", ["jj", "git", "remote", "list"]),
        ("jj-bookmarks", "jj bookmark list", ["jj", "bookmark", "list"]),
    ]

    info_sections = []
    for tag_name, cmd_description, cmd in commands:
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=5)
            if result.returncode == 0:
                output = result.stdout.strip()
            else:
                output = "(failed)"
        except (subprocess.TimeoutExpired, FileNotFoundError):
            output = "(unavailable)"

        section = f"""<{tag_name}>
<command>{cmd_description}</command>
<output>
{output}
</output>
</{tag_name}>"""
        info_sections.append(section)

    return "\n\n".join(info_sections)


def main():
    try:
        input_data = json.load(sys.stdin)
    except json.JSONDecodeError as e:
        print(f"Error: Invalid JSON input: {e}", file=sys.stderr)
        return 1

    # Check if we're in a jujutsu repository
    if is_in_jujutsu_repo():
        additional_messages = []

        # Check if we're on a current commit, if not handle it
        if not is_on_current_commit():
            uncommitted_message = handle_uncommitted_work()
            additional_messages.append(
                f"<commit-status>\n{uncommitted_message}\n</commit-status>"
            )

        # Get jujutsu repository information
        jj_info = get_jujutsu_info()

        # Combine all context information
        context_parts = [JUJUTSU_CONTEXT, jj_info] + additional_messages
        full_context = (
            f"<jujutsu-context>\n{chr(10).join(context_parts)}\n</jujutsu-context>"
        )

        response = {
            "hookSpecificOutput": {
                "hookEventName": "UserPromptSubmit",
                "additionalContext": full_context,
            }
        }
        print(json.dumps(response))

    return 0


if __name__ == "__main__":
    sys.exit(main())
