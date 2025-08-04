#!/usr/bin/env python3
# ABOUTME: Script to split jj util completion fish output into modular files
# ABOUTME: Handles multi-line strings and creates separate files for each subcommand

import subprocess
import sys
import re
from pathlib import Path
from typing import List, Dict, Tuple, Set


def get_subcommands_from_help() -> Tuple[Set[str], Dict[str, str]]:
    """
    Parse jj help output to get all subcommands and their aliases.
    Returns (all_subcommands, alias_to_main_mapping).
    """
    try:
        result = subprocess.run(
            ["jj", "help"],
            capture_output=True,
            text=True,
            check=True,
        )
        help_output = result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error running 'jj help': {e}")
        raise

    subcommands = set()
    alias_mappings = {}

    # Parse the Commands section
    in_commands_section = False

    for line in help_output.splitlines():
        if line.strip() == "Commands:":
            in_commands_section = True
            continue
        elif in_commands_section and line.strip() == "":
            # Empty line might end the commands section, but let's be cautious
            continue
        elif in_commands_section and line.strip().startswith("Options:"):
            # Definitely end of commands section
            break
        elif (
            in_commands_section and line.startswith("  ") and not line.startswith("   ")
        ):
            # Command line: "  command    Description [aliases: alias1, alias2]"
            # Strip leading spaces for easier parsing
            stripped_line = line.strip()
            # First try to match with aliases
            alias_match = re.match(
                r"^([a-zA-Z][a-zA-Z0-9-]*)\s+.*?\[(?:default )?alias(?:es)?: ([^\]]+)\]",
                stripped_line,
            )
            if alias_match:
                main_command = alias_match.group(1)
                subcommands.add(main_command)

                # Extract aliases
                aliases_str = alias_match.group(2)
                if aliases_str:
                    # Split by comma and clean up
                    aliases = [alias.strip() for alias in aliases_str.split(",")]
                    for alias in aliases:
                        alias_mappings[alias] = main_command
                        subcommands.add(alias)
                continue

            # Otherwise match regular commands without aliases
            match = re.match(r"^([a-zA-Z][a-zA-Z0-9-]*)\s+", stripped_line)
            if match:
                main_command = match.group(1)
                subcommands.add(main_command)

    return subcommands, alias_mappings


def get_completion_input() -> List[str]:
    """Get completion input from command line file argument, stdin, or jj command."""
    if len(sys.argv) > 1:
        # Read from file argument
        file_path = Path(sys.argv[1])
        print(f"Reading completion data from {file_path}...")
        try:
            with open(file_path, "r") as f:
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


def write_alias_completions(
    alias: str, main_command: str, main_command_lines: List[str], filepath: Path
):
    """Write duplicated completions for an alias by copying and transforming the main command's completions."""
    with open(filepath, "w") as f:
        f.write(
            f"# ABOUTME: Duplicated completions for jj {alias} (alias of jj {main_command})\n"
        )
        f.write(
            "# ABOUTME: Auto-generated from jj help output and main command completions\n\n"
        )

        # Transform each completion line from the main command
        for line in main_command_lines:
            # Replace references to the main command with the alias
            # Pattern: __fish_jj_using_subcommand main_command
            transformed_line = re.sub(
                rf"__fish_jj_using_subcommand {re.escape(main_command)}\b",
                f"__fish_jj_using_subcommand {alias}",
                line,
            )

            # Also handle cases with semicolon (e.g., "bookmark; and __fish_seen_subcommand_from")
            transformed_line = re.sub(
                rf"__fish_jj_using_subcommand {re.escape(main_command)};",
                f"__fish_jj_using_subcommand {alias};",
                transformed_line,
            )

            f.write(transformed_line + "\n")


def main():
    """Main function to split jj completions."""
    # Get subcommands and aliases from help first
    print("Discovering subcommands from jj help...")
    all_subcommands, alias_mappings = get_subcommands_from_help()
    print(f"Found {len(all_subcommands)} total subcommands")
    print(
        f"Found {len(alias_mappings)} aliases: {dict(list(alias_mappings.items())[:5])}{'...' if len(alias_mappings) > 5 else ''}"
    )

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
    print(f"Processing {len(sections['subcommands'])} subcommands...")
    main_commands_written = set()
    aliases_created = 0

    for subcommand, lines in sections["subcommands"].items():
        if not lines:  # Skip empty subcommands
            continue

        filename = f"{subcommand}.fish"

        # Check if this is an alias
        if subcommand in alias_mappings:
            main_command = alias_mappings[subcommand]

            # Look up the main command's completion lines
            if (
                main_command in sections["subcommands"]
                and sections["subcommands"][main_command]
            ):
                print(
                    f"  Duplicating completions {filename} <- {main_command} ({len(sections['subcommands'][main_command])} lines)"
                )
                write_alias_completions(
                    subcommand,
                    main_command,
                    sections["subcommands"][main_command],
                    output_dir / filename,
                )
                aliases_created += 1
            else:
                print(
                    f"  WARNING: No completions found for main command '{main_command}' (alias '{subcommand}')"
                )
                # Still create a basic file with a comment explaining the issue
                with open(output_dir / filename, "w") as f:
                    f.write(
                        f"# ABOUTME: Alias {subcommand} -> {main_command} but no completions found for main command\n"
                    )
                    f.write(
                        "# ABOUTME: This may happen if the main command has no specific completions\n"
                    )
        else:
            print(f"  Writing main command {filename} ({len(lines)} lines)")
            write_section_to_file(
                lines,
                output_dir / filename,
                f"Completions for jj {subcommand} subcommand",
            )
            main_commands_written.add(subcommand)

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
    print(f"  - {len(main_commands_written)} main command files")
    print(f"  - {aliases_created} alias wrapper files")
    print(f"  - {main_completion_path} (main loader)")

    if alias_mappings:
        print(f"\nAlias mappings created:")
        for alias, main in sorted(alias_mappings.items()):
            if alias in [
                s for s in sections["subcommands"].keys() if sections["subcommands"][s]
            ]:
                print(f"  {alias} -> {main}")


if __name__ == "__main__":
    main()
