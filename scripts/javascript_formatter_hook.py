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
import shutil
import click


def find_prettier_command():
    """Find the best available prettier command in order of preference."""
    commands = [
        ["pnpm", "exec", "prettier"],
        ["npm", "exec", "prettier"],
        ["npx", "prettier"],
        ["prettier"],
    ]

    for cmd in commands:
        try:
            # Test if the command is available
            result = subprocess.run(
                cmd + ["--version"], capture_output=True, text=True, timeout=5
            )
            if result.returncode == 0:
                return cmd
        except (subprocess.TimeoutExpired, FileNotFoundError):
            continue

    return None


def is_ignored_by_prettier(file_path):
    """Check if file is ignored by .prettierignore."""
    dir_path = os.path.dirname(file_path)
    ignore_file = os.path.join(dir_path, ".prettierignore")

    # Walk up directory tree looking for .prettierignore
    while dir_path != os.path.dirname(dir_path):  # Not root
        ignore_file = os.path.join(dir_path, ".prettierignore")
        if os.path.exists(ignore_file):
            try:
                with open(ignore_file, "r") as f:
                    patterns = f.read().splitlines()
                    # Simple pattern matching - not implementing full gitignore spec
                    filename = os.path.basename(file_path)
                    for pattern in patterns:
                        pattern = pattern.strip()
                        if pattern and not pattern.startswith("#"):
                            if pattern in file_path or pattern == filename:
                                return True
            except Exception:
                pass
        dir_path = os.path.dirname(dir_path)

    return False


@click.command()
@click.option("--single-quote/--double-quote", default=True, help="Use single quotes")
@click.option("--tab-width", default=2, help="Tab width for indentation")
def main(single_quote, tab_width):
    """Claude Code hook that formats JavaScript files using prettier."""
    try:
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)

        # Extract file path from tool input
        file_path = data.get("tool_input", {}).get("file_path", "")
        if not file_path:
            print("No file_path found in tool input", file=sys.stderr)
            return 1

        # Check if file is ignored by prettier
        if is_ignored_by_prettier(file_path):
            print(f"File {file_path} is ignored by .prettierignore", file=sys.stderr)
            return 0

        # Find prettier command
        prettier_cmd = find_prettier_command()
        if not prettier_cmd:
            print(
                "prettier is not available (tried pnpm exec, npm exec, npx, and global)",
                file=sys.stderr,
            )
            return 1

        # Build prettier command
        cmd = prettier_cmd + ["--write", "--tab-width", str(tab_width), file_path]

        if single_quote:
            cmd.insert(-1, "--single-quote")

        # Run prettier
        try:
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)

            if result.returncode == 0:
                print(
                    f"Successfully formatted JavaScript file: {file_path}",
                    file=sys.stderr,
                )
                return 0
            else:
                print(
                    f"prettier failed for {file_path}: {result.stderr}", file=sys.stderr
                )
                return 2

        except subprocess.TimeoutExpired:
            print(f"prettier timed out for {file_path}", file=sys.stderr)
            return 2
        except Exception as e:
            print(f"Failed to run prettier: {e}", file=sys.stderr)
            return 2

    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
