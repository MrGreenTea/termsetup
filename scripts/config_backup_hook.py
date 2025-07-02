#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "click"
# ]
# ///

import json
import sys
import subprocess
import os
import time
import glob
import click


# Important config file patterns to backup
CONFIG_PATTERNS = [
    "*/.bashrc",
    "*/.zshrc",
    "*/.gitconfig",
    "*/.ssh/config",
    "*/wezterm.lua",
    "*/fish/config.fish",
    "*/.vimrc",
    "*/.tmux.conf",
    "*/settings.json",  # VS Code, Claude Code settings
    "*/.editorconfig",
]


def matches_config_pattern(file_path):
    """Check if file path matches any important config patterns."""
    for pattern in CONFIG_PATTERNS:
        if file_path.endswith(pattern[1:]):  # Remove the * prefix
            return True
        # Also check if the file name itself matches (for nested configs)
        basename = os.path.basename(file_path)
        pattern_basename = os.path.basename(pattern[1:])
        if basename == pattern_basename:
            return True
    return False


def cleanup_old_backups(backup_dir, original_filename, max_backups):
    """Remove old backup files, keeping only the most recent max_backups."""
    if max_backups <= 0:
        return

    # Find all backup files for this original file
    backup_pattern = os.path.join(backup_dir, f"{original_filename}.backup.*")
    backup_files = glob.glob(backup_pattern)

    if len(backup_files) <= max_backups:
        return

    # Sort by modification time (oldest first)
    backup_files.sort(key=lambda x: os.path.getmtime(x))

    # Remove oldest files
    files_to_remove = backup_files[:-max_backups]
    for old_backup in files_to_remove:
        try:
            os.remove(old_backup)
            print(f"Removed old backup: {old_backup}", file=sys.stderr)
        except Exception as e:
            print(f"Failed to remove old backup {old_backup}: {e}", file=sys.stderr)


@click.command()
@click.option(
    "--max-backups", default=10, help="Maximum number of backups to keep per file"
)
@click.option(
    "--backup-dir",
    default=None,
    help="Custom backup directory (default: ~/.claude/backups)",
)
def main(max_backups, backup_dir):
    """Claude Code hook that creates backups of important config files before editing."""
    try:
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)

        # Extract file path from tool input
        file_path = data.get("tool_input", {}).get("file_path", "")
        if not file_path:
            print("No file_path found in tool input", file=sys.stderr)
            return 1

        # Check if this file should be backed up
        if not matches_config_pattern(file_path):
            # Not a config file we care about, exit successfully without doing anything
            return 0

        # Check if file exists
        if not os.path.exists(file_path):
            print(f"File {file_path} does not exist, skipping backup", file=sys.stderr)
            return 0

        # Set up backup directory
        if backup_dir is None:
            backup_dir = os.path.expanduser("~/.claude/backups")

        try:
            os.makedirs(backup_dir, exist_ok=True)
        except Exception as e:
            print(
                f"Failed to create backup directory {backup_dir}: {e}", file=sys.stderr
            )
            return 2

        # Generate backup filename with timestamp
        timestamp = int(time.time())
        original_filename = os.path.basename(file_path)
        backup_filename = f"{original_filename}.backup.{timestamp}"
        backup_path = os.path.join(backup_dir, backup_filename)

        # Create backup using cp command
        try:
            result = subprocess.run(
                ["cp", file_path, backup_path],
                capture_output=True,
                text=True,
                timeout=10,
            )

            if result.returncode == 0:
                print(f"Created backup: {backup_path}", file=sys.stderr)

                # Clean up old backups if requested
                if max_backups > 0:
                    cleanup_old_backups(backup_dir, original_filename, max_backups)

                return 0
            else:
                print(
                    f"Failed to create backup of {file_path}: {result.stderr}",
                    file=sys.stderr,
                )
                return 2

        except subprocess.TimeoutExpired:
            print(f"Backup operation timed out for {file_path}", file=sys.stderr)
            return 2
        except Exception as e:
            print(f"Failed to run cp command: {e}", file=sys.stderr)
            return 2

    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
