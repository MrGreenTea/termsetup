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
from pathlib import Path


def analyze_git_changes():
    """Analyze git changes to suggest conventional commit type."""
    try:
        # Get staged files
        result = subprocess.run(
            ['git', 'diff', '--cached', '--name-only'],
            capture_output=True,
            text=True,
            check=True
        )
        staged_files = result.stdout.strip().split('\n') if result.stdout.strip() else []
        
        # Get git diff for analysis
        result = subprocess.run(
            ['git', 'diff', '--cached'],
            capture_output=True,
            text=True,
            check=True
        )
        diff_content = result.stdout
        
        # Analyze changes to suggest commit type
        commit_type = "feat"  # default
        
        # Check for specific patterns
        if any(f.endswith('.md') for f in staged_files):
            commit_type = "docs"
        elif any(f.startswith('test') or 'test' in f for f in staged_files):
            commit_type = "test"
        elif any(f.endswith('.json') or f.endswith('.yml') or f.endswith('.yaml') for f in staged_files):
            commit_type = "chore"
        elif re.search(r'(fix|bug|error|issue)', diff_content, re.IGNORECASE):
            commit_type = "fix"
        elif re.search(r'(refactor|cleanup|reorganize)', diff_content, re.IGNORECASE):
            commit_type = "refactor"
        elif re.search(r'(style|format|lint)', diff_content, re.IGNORECASE):
            commit_type = "style"
        elif re.search(r'(perf|performance|optimize)', diff_content, re.IGNORECASE):
            commit_type = "perf"
        
        return commit_type, staged_files
        
    except subprocess.CalledProcessError:
        return "feat", []


def generate_commit_message(commit_type, staged_files):
    """Generate a conventional commit message template."""
    
    # Get scope suggestion from files
    scope = ""
    if staged_files:
        common_dirs = set()
        for file in staged_files:
            parts = Path(file).parts
            if len(parts) > 1:
                common_dirs.add(parts[0])
        
        if len(common_dirs) == 1:
            scope = f"({list(common_dirs)[0]})"
    
    # Generate the message template
    template = f"{commit_type}{scope}: "
    
    return template


@click.command()
def main():
    """Hook that suggests conventional commit messages when Claude Code completes successfully."""
    
    try:
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)
        
        # Check if stop hook is already active to prevent loops
        if data.get("stop_hook_active", False):
            # Allow normal stopping if hook is already active
            return 0
        
        # Check if we're in a git repository
        try:
            subprocess.run(['git', 'rev-parse', '--git-dir'], 
                         capture_output=True, check=True)
        except subprocess.CalledProcessError:
            # Not in a git repo, allow normal stopping
            return 0
        
        # Check if there are staged changes
        result = subprocess.run(
            ['git', 'diff', '--cached', '--quiet'],
            capture_output=True
        )
        
        if result.returncode == 0:
            # No staged changes, allow normal stopping
            return 0
        
        # Analyze changes and generate commit message
        commit_type, staged_files = analyze_git_changes()
        commit_template = generate_commit_message(commit_type, staged_files)
        
        # Output user message to stderr
        print(f"\n💡 Conventional commit suggestion: {commit_template}", file=sys.stderr)
        print(f"   Files changed: {', '.join(staged_files[:3])}", file=sys.stderr)
        if len(staged_files) > 3:
            print(f"   ... and {len(staged_files) - 3} more files", file=sys.stderr)
        
        # Block the stop with decision control JSON to stdout
        decision_response = {
            "decision": "block",
            "reason": f"You have staged changes ready to commit. Consider running: git commit -m \"{commit_template}[description]\" to commit your changes with the suggested conventional commit format."
        }
        
        print(json.dumps(decision_response), flush=True)
        return 0
        
    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == '__main__':
    sys.exit(main())