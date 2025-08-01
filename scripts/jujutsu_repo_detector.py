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
</gh-usage>"""


def is_in_jujutsu_repo():
    """Check if current directory is inside a jujutsu repository"""
    try:
        result = subprocess.run(
            ["jj", "workspace", "root"], capture_output=True, text=True, timeout=2
        )
        return result.returncode == 0
    except (subprocess.TimeoutExpired, FileNotFoundError):
        return False


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
        # Get jujutsu repository information
        jj_info = get_jujutsu_info()

        # Add context to inform Claude about jujutsu repository
        full_context = (
            f"<jujutsu-context>\n{JUJUTSU_CONTEXT}\n\n{jj_info}\n</jujutsu-context>"
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
