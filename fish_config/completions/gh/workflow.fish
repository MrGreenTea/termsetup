# ABOUTME: Enhanced completions for gh workflow subcommands
# ABOUTME: Provides dynamic workflow completion and context-aware suggestions

# Complete workflow names for commands that operate on specific workflows
complete -c gh -n "__fish_gh_using_subcommand workflow; and __fish_seen_subcommand_from run disable enable view" -f -a '(__fish_gh_complete_workflows)'

# Add --repo flag completion for workflow commands
complete -c gh -n "__fish_gh_using_subcommand workflow" -s R -l repo -f -a '(__fish_gh_complete_repos)' -d 'Select another repository'