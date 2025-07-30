#!/usr/bin/env python3
# ABOUTME: Script to split jj util completion fish output into modular files
# ABOUTME: Handles multi-line strings and creates separate files for each subcommand

import subprocess
import sys
import re
from pathlib import Path
from typing import List, Dict, Tuple


def get_completion_input() -> List[str]:
    """Get completion input from command line file argument, stdin, or jj command."""
    if len(sys.argv) > 1:
        # Read from file argument
        file_path = Path(sys.argv[1])
        print(f"Reading completion data from {file_path}...")
        try:
            with open(file_path, 'r') as f:
                return f.read().splitlines()
        except IOError as e:
            print(f"Error reading file {file_path}: {e}")
            raise
    elif not sys.stdin.isatty():
        # Read from stdin
        print("Reading completion data from stdin...")
        return sys.stdin.read().splitlines()
    else:
        # Run jj util completion fish
        print("Getting jj completion output...")
        try:
            result = subprocess.run(
                ["jj", "util", "completion", "fish"],
                capture_output=True,
                text=True,
                check=True,
            )
            return result.stdout.splitlines()
        except subprocess.CalledProcessError as e:
            print(f"Error running 'jj util completion fish': {e}")
            raise


def is_multiline_color_start(line: str) -> bool:
    """Check if line starts a multi-line color completion."""
    return "-l color" in line and line.endswith("\"always\\t''")


def is_multiline_color_end(line: str) -> bool:
    """Check if line ends a multi-line color completion."""
    return line.strip() == "auto\\t''\""


def collect_multiline_completion(
    lines: List[str], start_idx: int
) -> Tuple[List[str], int]:
    """
    Collect a multi-line completion starting at start_idx.
    Returns the collected lines and the next index to process.
    """
    collected = [lines[start_idx]]
    idx = start_idx + 1

    while idx < len(lines) and not is_multiline_color_end(lines[idx]):
        collected.append(lines[idx])
        idx += 1

    if idx < len(lines):
        collected.append(lines[idx])  # Include the ending line
        idx += 1

    return collected, idx


def parse_sections(lines: List[str]) -> Dict[str, List[str]]:
    """Parse the completion output into sections."""
    sections = {"functions": [], "global": [], "subcommands": {}}

    current_section = "functions"
    current_subcommand = None
    i = 0

    while i < len(lines):
        line = lines[i]

        # Check for multi-line color completion
        if is_multiline_color_start(line):
            multiline_block, next_i = collect_multiline_completion(lines, i)

            if current_section == "functions":
                sections["functions"].extend(multiline_block)
            elif current_section == "global":
                sections["global"].extend(multiline_block)
            elif current_section == "subcommands" and current_subcommand:
                if current_subcommand not in sections["subcommands"]:
                    sections["subcommands"][current_subcommand] = []
                sections["subcommands"][current_subcommand].extend(multiline_block)

            i = next_i
            continue

        # Detect section transitions
        if line.startswith('complete -c jj -n "__fish_jj_needs_command"'):
            if current_section == "functions":
                current_section = "global"
            sections["global"].append(line)
        elif line.startswith('complete -c jj -n "__fish_jj_using_subcommand'):
            current_section = "subcommands"

            # Extract subcommand name
            match = re.search(r"__fish_jj_using_subcommand ([a-zA-Z-]+)", line)
            if match:
                current_subcommand = match.group(1)
                if current_subcommand not in sections["subcommands"]:
                    sections["subcommands"][current_subcommand] = []
                sections["subcommands"][current_subcommand].append(line)
            else:
                # Handle complex subcommand patterns like "bookmark; and __fish_seen_subcommand_from"
                complex_match = re.search(
                    r"__fish_jj_using_subcommand ([a-zA-Z-]+);", line
                )
                if complex_match:
                    current_subcommand = complex_match.group(1)
                    if current_subcommand not in sections["subcommands"]:
                        sections["subcommands"][current_subcommand] = []
                    sections["subcommands"][current_subcommand].append(line)
        elif line.startswith("function ") or line.startswith("end"):
            # Function definitions
            sections["functions"].append(line)
        elif current_section == "subcommands" and current_subcommand:
            # Lines belonging to current subcommand
            sections["subcommands"][current_subcommand].append(line)
        elif current_section == "global":
            # Global completion lines
            sections["global"].append(line)
        else:
            # Default to functions section
            sections["functions"].append(line)

        i += 1

    return sections


def write_section_to_file(lines: List[str], filepath: Path, header_comment: str):
    """Write a section to a file with proper header."""
    with open(filepath, "w") as f:
        f.write(f"# ABOUTME: {header_comment}\n")
        f.write("# ABOUTME: Auto-generated from jj util completion fish\n\n")

        for line in lines:
            f.write(line + "\n")


def main():
    """Main function to split jj completions."""
    # Get completion input
    lines = get_completion_input()
    print(f"Got {len(lines)} lines of completion data")

    # Parse into sections
    print("Parsing sections...")
    sections = parse_sections(lines)

    # Set up output directory
    output_dir = Path("fish_config/completions/jj")
    output_dir.mkdir(parents=True, exist_ok=True)

    # Write core functions
    print("Writing _core.fish...")
    write_section_to_file(
        sections["functions"],
        output_dir / "_core.fish",
        "Core helper functions for jj completion system",
    )

    # Write global completions
    print("Writing _global.fish...")
    write_section_to_file(
        sections["global"],
        output_dir / "_global.fish",
        "Global options and main command completions for jj",
    )

    # Write individual subcommand files
    print(f"Writing {len(sections['subcommands'])} subcommand files...")
    for subcommand, lines in sections["subcommands"].items():
        if lines:  # Only write non-empty files
            filename = f"{subcommand}.fish"
            print(f"  Writing {filename} ({len(lines)} lines)")
            write_section_to_file(
                lines,
                output_dir / filename,
                f"Completions for jj {subcommand} subcommand",
            )

    # Create main completion file that sources everything
    main_completion_lines = [
        "# Load core functions",
        "source (dirname (status --current-filename))/jj/_core.fish",
        "",
        "# Load global completions",
        "source (dirname (status --current-filename))/jj/_global.fish",
        "",
        "# Load subcommand completions",
    ]

    for subcommand in sorted(sections["subcommands"].keys()):
        if sections["subcommands"][subcommand]:  # Only source non-empty files
            main_completion_lines.append(
                f"source (dirname (status --current-filename))/jj/{subcommand}.fish"
            )

    main_completion_path = Path("fish_config/completions/jj.fish")
    with open(main_completion_path, "w") as f:
        f.write(
            "# ABOUTME: Main jj completion file that sources all modular completion files\n"
        )
        f.write("# ABOUTME: Auto-generated from jj util completion fish\n\n")
        for line in main_completion_lines:
            f.write(line + "\n")

    print("✓ Split complete! Created:")
    print(f"  - {output_dir}/_core.fish ({len(sections['functions'])} lines)")
    print(f"  - {output_dir}/_global.fish ({len(sections['global'])} lines)")
    print(
        f"  - {len([s for s in sections['subcommands'].values() if s])} subcommand files"
    )
    print(f"  - {main_completion_path} (main loader)")


if __name__ == "__main__":
    main()
