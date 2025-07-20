#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "click"
# ]
# ///

import json
import sys
import subprocess
import click
import re
import os
from pathlib import Path


def analyze_git_changes():
    """Analyze git changes to suggest conventional commit type."""
    try:
        # Get staged files
        result = subprocess.run(
            ["git", "diff", "--cached", "--name-only"],
            capture_output=True,
            text=True,
            check=True,
        )
        staged_files = (
            result.stdout.strip().split("\n") if result.stdout.strip() else []
        )

        # Get unstaged files
        result = subprocess.run(
            ["git", "diff", "--name-only"], capture_output=True, text=True, check=True
        )
        unstaged_files = (
            result.stdout.strip().split("\n") if result.stdout.strip() else []
        )

        # Get git diff for analysis (both staged and unstaged)
        result = subprocess.run(
            ["git", "diff", "--cached"], capture_output=True, text=True, check=True
        )
        staged_diff = result.stdout

        result = subprocess.run(
            ["git", "diff"], capture_output=True, text=True, check=True
        )
        unstaged_diff = result.stdout

        # Combine diffs for analysis
        diff_content = staged_diff + unstaged_diff

        # Analyze changes to suggest commit type using CursorAI approach
        commit_type = "chore"  # default

        # First check for action verbs in diff content (like CursorAI)
        if re.search(
            r"\+.*\b(add|create|implement|new)\b", diff_content, re.IGNORECASE
        ):
            commit_type = "feat"
        elif re.search(
            r"\+.*\b(fix|correct|resolve|bug)\b", diff_content, re.IGNORECASE
        ):
            commit_type = "fix"
        elif re.search(
            r"\+.*\b(refactor|restructure|reorganize)\b", diff_content, re.IGNORECASE
        ):
            commit_type = "refactor"
        elif re.search(r"\+.*\b(test|spec)\b", diff_content, re.IGNORECASE):
            commit_type = "test"
        elif re.search(r"\+.*\b(doc|comment|readme)\b", diff_content, re.IGNORECASE):
            commit_type = "docs"
        elif re.search(r"\+.*\b(style|format|lint)\b", diff_content, re.IGNORECASE):
            commit_type = "style"
        elif re.search(
            r"\+.*\b(perf|performance|optimize)\b", diff_content, re.IGNORECASE
        ):
            commit_type = "perf"
        # Then check file-based patterns (fallback)
        elif any(f.endswith(".md") or "README" in f for f in staged_files):
            commit_type = "docs"
        elif any(
            f.startswith("test")
            or "test" in f
            or f.endswith(".test.")
            or f.endswith(".spec.")
            for f in staged_files
        ):
            commit_type = "test"
        elif any(
            f.endswith(".json")
            or f.endswith(".yml")
            or f.endswith(".yaml")
            or f.endswith(".toml")
            for f in staged_files
        ):
            commit_type = "chore"
        # Check for general patterns in diff
        elif re.search(r"(fix|bug|error|issue)", diff_content, re.IGNORECASE):
            commit_type = "fix"
        elif re.search(r"(refactor|cleanup|reorganize)", diff_content, re.IGNORECASE):
            commit_type = "refactor"
        elif re.search(r"(style|format|lint)", diff_content, re.IGNORECASE):
            commit_type = "style"
        elif re.search(r"(perf|performance|optimize)", diff_content, re.IGNORECASE):
            commit_type = "perf"
        # If we're adding new content, likely a feature
        elif re.search(r"^\+.*\S", diff_content, re.MULTILINE):
            commit_type = "feat"

        return commit_type, staged_files, unstaged_files, diff_content

    except subprocess.CalledProcessError:
        return "chore", [], [], ""


def extract_commit_description(diff_content, commit_type):
    """Extract a meaningful commit description from diff content."""
    # Look for function/class names being added
    function_matches = re.findall(r"\+.*def\s+(\w+)", diff_content)
    class_matches = re.findall(r"\+.*class\s+(\w+)", diff_content)

    # Look for comment patterns that might indicate what was done
    comment_matches = re.findall(r"\+.*(?:#|//|/\*)\s*([A-Z].*)", diff_content)

    # Generate description based on commit type and findings
    if function_matches:
        if commit_type == "feat":
            return f"add {function_matches[0]} function"
        elif commit_type == "fix":
            return f"fix {function_matches[0]} function"
        elif commit_type == "refactor":
            return f"refactor {function_matches[0]} function"
        else:
            return f"update {function_matches[0]} function"
    elif class_matches:
        if commit_type == "feat":
            return f"add {class_matches[0]} class"
        elif commit_type == "fix":
            return f"fix {class_matches[0]} class"
        else:
            return f"update {class_matches[0]} class"
    elif comment_matches:
        # Use the first meaningful comment as description
        comment = comment_matches[0].strip()
        if len(comment) > 50:
            comment = comment[:47] + "..."
        return comment.lower()
    else:
        # Generic descriptions based on type
        type_descriptions = {
            "feat": "add new feature",
            "fix": "fix bug",
            "docs": "update documentation",
            "style": "improve formatting",
            "refactor": "refactor code",
            "perf": "improve performance",
            "test": "add tests",
            "chore": "update configuration",
        }
        return type_descriptions.get(commit_type, "make changes")


def generate_commit_message(commit_type, staged_files, diff_content=None):
    """Generate a conventional commit message template."""

    # Get scope suggestion from files using CursorAI approach
    scope = ""
    if staged_files:
        # Get common directory path
        common_dirs = set()
        for file in staged_files:
            file_path = Path(file)
            if len(file_path.parts) > 1:
                # Use directory path, convert slashes to dashes
                dir_path = str(file_path.parent).replace("/", "-").replace("\\", "-")
                common_dirs.add(dir_path)

        # If all files share the same directory structure, use it as scope
        if len(common_dirs) == 1:
            scope_name = list(common_dirs)[0]
            # Clean up scope name (remove leading dots, limit length)
            if scope_name.startswith("."):
                scope_name = scope_name[1:]
            if len(scope_name) > 20:  # Limit scope length
                scope_name = scope_name[:20]
            if scope_name and scope_name != ".":
                scope = f"({scope_name})"
        elif len(common_dirs) > 1:
            # Multiple directories - check if they're related
            dir_list = sorted(common_dirs)
            # Find common prefix
            common_prefix = ""
            if len(dir_list) > 1:
                first_parts = dir_list[0].split("-")
                for i, part in enumerate(first_parts):
                    if all(
                        d.split("-")[i : i + 1] == [part]
                        for d in dir_list
                        if len(d.split("-")) > i
                    ):
                        common_prefix += part + "-"
                    else:
                        break
            if common_prefix and len(common_prefix) > 2:
                scope = f"({common_prefix.rstrip('-')})"

    # Generate description if diff content is provided
    description = ""
    if diff_content:
        description = extract_commit_description(diff_content, commit_type)

    # Generate the message template
    if description:
        template = f"{commit_type}{scope}: {description}"
    else:
        template = f"{commit_type}{scope}: "

    return template


@click.command()
def main():
    """Hook that suggests conventional commit messages when Claude Code completes successfully."""

    try:
        # Allow bypassing for unrelated changes
        if os.environ.get('IGNORE_COMMIT_HOOK') == '1':
            return 0
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)

        # Check if stop hook is already active to prevent loops
        if data.get("stop_hook_active", False):
            # Allow normal stopping if hook is already active
            return 0

        # Check if we're in a git repository
        try:
            subprocess.run(
                ["git", "rev-parse", "--git-dir"], capture_output=True, check=True
            )
        except subprocess.CalledProcessError:
            # Not in a git repo, allow normal stopping
            return 0

        # Check if there are staged changes
        staged_result = subprocess.run(
            ["git", "diff", "--cached", "--quiet"], capture_output=True
        )

        # Check if there are unstaged changes
        unstaged_result = subprocess.run(
            ["git", "diff", "--quiet"], capture_output=True
        )

        if staged_result.returncode == 0 and unstaged_result.returncode == 0:
            # No staged or unstaged changes, allow normal stopping
            return 0

        # Analyze changes and generate commit message
        commit_type, staged_files, unstaged_files, diff_content = analyze_git_changes()
        all_files = staged_files + unstaged_files
        commit_template = generate_commit_message(commit_type, all_files, diff_content)

        # Output user message to stderr
        print(
            f"\n💡 Conventional commit suggestion: {commit_template}", file=sys.stderr
        )

        # Show different file categories
        if staged_files:
            print(f"   Staged files: {', '.join(staged_files[:3])}", file=sys.stderr)
            if len(staged_files) > 3:
                print(
                    f"   ... and {len(staged_files) - 3} more staged files",
                    file=sys.stderr,
                )

        if unstaged_files:
            print(
                f"   Unstaged files: {', '.join(unstaged_files[:3])}", file=sys.stderr
            )
            if len(unstaged_files) > 3:
                print(
                    f"   ... and {len(unstaged_files) - 3} more unstaged files",
                    file=sys.stderr,
                )

        print(f"   💡 If these changes are unrelated to your current work, you can ignore this suggestion.", file=sys.stderr)

        # Block the stop with decision control JSON to stdout
        reason_parts = []
        if staged_files:
            reason_parts.append("staged changes")
        if unstaged_files:
            reason_parts.append("unstaged changes")

        change_types = " and ".join(reason_parts)

        if staged_files and unstaged_files:
            suggestion = f"Consider staging your changes with 'git add .' and then running: git commit -m \"{commit_template}[description]\""
        elif staged_files:
            suggestion = (
                f'Consider running: git commit -m "{commit_template}[description]"'
            )
        else:
            suggestion = f"Consider staging your changes with 'git add .' and then running: git commit -m \"{commit_template}[description]\""

        decision_response = {
            "decision": "block",
            "reason": f"You have {change_types} ready to commit. {suggestion} to commit your changes with the suggested conventional commit format. If these changes are unrelated to your current work, you may ignore this suggestion.",
        }

        print(json.dumps(decision_response), flush=True)
        return 0

    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
