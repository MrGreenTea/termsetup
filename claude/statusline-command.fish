#!/bin/fish
# ABOUTME: Claude Code status line command that shows context info with VCS status
# ABOUTME: Prioritizes jujutsu over git, similar to the WezTerm status bar configuration

# Read JSON input from stdin
set input (cat)

# Extract useful information from the JSON input
set model_name (echo "$input" | jq -r '.model.display_name // "Claude"')
set current_dir (echo "$input" | jq -r '.workspace.current_dir // ""')
set project_dir (echo "$input" | jq -r '.workspace.project_dir // ""')
set output_style (echo "$input" | jq -r '.output_style.name // "default"')

# remove the first empty line
# remove the third prompt line
starship prompt | head -n 2 | tail -n 1
