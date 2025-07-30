# ABOUTME: Enhanced completions for gh issue subcommands
# ABOUTME: Provides dynamic issue number completion and context-aware suggestions

# Complete issue numbers for commands that operate on specific issues
complete -c gh -n "__fish_gh_using_subcommand issue; and __fish_seen_subcommand_from view close reopen comment edit lock unlock transfer pin unpin" -f -a '(__fish_gh_complete_issues)'

# Add --repo flag completion for issue commands
complete -c gh -n "__fish_gh_using_subcommand issue" -s R -l repo -f -a '(__fish_gh_complete_repos)' -d 'Select another repository'