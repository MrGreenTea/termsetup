#!/usr/bin/env -S uv run --script
# /// script
# dependencies = [
#     "click"
# ]
# ///

import json
import sys
import subprocess
import shutil
import click


@click.command()
@click.option('--check-only', is_flag=True, help='Check formatting without making changes')
def main(check_only):
    """Claude Code hook that formats Python files using ruff."""
    try:
        # Read JSON input from stdin
        input_data = sys.stdin.read()
        data = json.loads(input_data)
        
        # Extract file path from tool input
        file_path = data.get('tool_input', {}).get('file_path', '')
        if not file_path:
            print("No file_path found in tool input", file=sys.stderr)
            return 1
        
        # Check if ruff is available
        if not shutil.which('ruff'):
            print("ruff is not installed or not in PATH", file=sys.stderr)
            return 1
        
        # Build ruff command
        cmd = ['ruff', 'format']
        if check_only:
            cmd.append('--check')
        cmd.append(file_path)
        
        # Run ruff format
        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=30
            )
            
            if result.returncode == 0:
                if check_only:
                    print(f"Python file {file_path} is properly formatted", file=sys.stderr)
                else:
                    print(f"Successfully formatted Python file: {file_path}", file=sys.stderr)
                return 0
            else:
                print(f"ruff format failed for {file_path}: {result.stderr}", file=sys.stderr)
                return 2
                
        except subprocess.TimeoutExpired:
            print(f"ruff format timed out for {file_path}", file=sys.stderr)
            return 2
        except Exception as e:
            print(f"Failed to run ruff format: {e}", file=sys.stderr)
            return 2
        
    except json.JSONDecodeError as e:
        print(f"Failed to parse JSON input: {e}", file=sys.stderr)
        return 1
    except Exception as e:
        print(f"Unexpected error: {e}", file=sys.stderr)
        return 2


if __name__ == '__main__':
    sys.exit(main())