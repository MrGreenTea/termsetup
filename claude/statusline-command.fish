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

# Get directory name for display
if test -z "$current_dir"
	set dir_display "~"
else if test "$current_dir" = "$HOME"
	set dir_display "~"
else
	set dir_display (basename "$current_dir")
end

# Function to get jujutsu information
function get_jj_info
	set -l dir $argv[1]
	if test -z "$dir"
		return 1
	end
	
	# Check if this is a jujutsu repo
	if test -d "$dir/.jj"
		set -l output (starship-jj starship prompt 2>/dev/null)
		if test -n "$output"
			# Strip ANSI color codes
			echo "$output" | sed 's/\x1b\[[0-9;]*m//g' | string trim
			return 0
		end
	end
	return 1
end

# Function to get git information (fallback)
function get_git_info
	set -l dir $argv[1]
	if test -z "$dir"
		return 1
	end

	if git -C "$dir" rev-parse --git-dir >/dev/null 2>&1
		set -l branch (git -C "$dir" branch --show-current 2>/dev/null; or echo "detached")
		set -l status (git -C "$dir" status --porcelain 2>/dev/null)

		set -l status_summary ""
		if test -n "$status"
			set -l modified (echo "$status" | grep -c "^ M\|^M " 2>/dev/null; or echo "0")
			set -l added (echo "$status" | grep -c "^A " 2>/dev/null; or echo "0")
			set -l deleted (echo "$status" | grep -c "^ D\|^D " 2>/dev/null; or echo "0")
			set -l untracked (echo "$status" | grep -c "^??" 2>/dev/null; or echo "0")

			set -l indicators
			test "$added" -gt 0; and set -a indicators "+$added"
			test "$modified" -gt 0; and set -a indicators "~$modified"
			test "$deleted" -gt 0; and set -a indicators "-$deleted"
			test "$untracked" -gt 0; and set -a indicators "?$untracked"

			if test (count $indicators) -gt 0
				set status_summary " "(string join ' ' $indicators)
			end
		end

		printf "%s%s" "$branch" "$status_summary"
		return 0
	end
	return 1
end

# Build status line components
set components

# Model and output style
if test "$output_style" != "default"
	set -a components "$model_name ($output_style)"
else
	set -a components "$model_name"
end

# Directory
set -a components "$dir_display"

# VCS info (prioritize jujutsu over git)
if test -n "$current_dir"
	set -l vcs_info (get_jj_info "$current_dir" 2>/dev/null)
	if test -n "$vcs_info"
		set -a components "jj:$vcs_info"
	else
		set vcs_info (get_git_info "$current_dir" 2>/dev/null)
		if test -n "$vcs_info"
			set -a components "git:$vcs_info"
		end
	end
end

# Join components with " | "
printf "%s" (string join ' | ' $components)
