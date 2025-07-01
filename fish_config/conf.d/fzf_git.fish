# FZF Git Operations Keybindings
# Enhanced git workflow using FZF for fuzzy finding

# Ctrl+G B: Fuzzy search and switch git branches
bind \cg\cb gco

# Ctrl+G F: Fuzzy search modified files with actions (add/restore/diff)
bind \cg\cf __fzf_git_files

# Ctrl+G L: Search git log with preview, copy hash or checkout
bind \cg\cl __fzf_git_log_enhanced

# Ctrl+G S: Interactive git status with staging options
bind \cg\cs __fzf_git_status_enhanced
