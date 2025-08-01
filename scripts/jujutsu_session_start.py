#!/usr/bin/env -S uv run --quiet --python 3.12
# /// script
# dependencies = []
# ///
# ABOUTME: Comprehensive jujutsu context for session start - provides full environment info
# ABOUTME: Runs once per session with detailed jujutsu repository context and usage instructions

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


def get_jujutsu_info():
    """Get comprehensive jujutsu repository information"""
    commands = [
        ("jj-remotes", "jj git remote list", ["jj", "git", "remote", "list"]),
        ("jj-bookmarks", "jj bookmark list", ["jj", "bookmark", "list"]),
        (
            "jj-recent-commits",
            "jj log --limit 5",
            [
                "jj",
                "log",
                "-T",
                'if(current_working_copy, "<working-copy>\\n<change-id>\\n" ++ change_id.shortest(8) ++ "\\n</change-id>\\n<description>\\n" ++ description.first_line() ++ "\\n</description>\\n</working-copy>\\n", "<commit>\\n<change-id>\\n" ++ change_id.shortest(8) ++ "\\n</change-id>\\n<description>\\n" ++ description.first_line() ++ "\\n</description>\\n</commit>\\n")',
                "--limit",
                "5",
                "--no-graph",
            ],
        ),
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

    # Get the hook event name from input
    hook_event_name = input_data.get("hook_event_name", "SessionStart")

    # Check if we're in a jujutsu repository
    if is_in_jujutsu_repo():
        # Get comprehensive jujutsu repository information
        jj_info = get_jujutsu_info()

        # Combine all context information
        context_parts = [JUJUTSU_CONTEXT, jj_info]
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
