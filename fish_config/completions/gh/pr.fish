# ABOUTME: Enhanced completions for gh pr subcommands
# ABOUTME: Provides dynamic PR number completion and context-aware suggestions

# Complete PR numbers for commands that operate on specific PRs
complete -c gh -n "__fish_gh_using_subcommand pr; and __fish_seen_subcommand_from checkout view close reopen merge review comment diff edit lock unlock update-branch" -f -a '(__fish_gh_complete_prs)'

# Complete branch names for pr checkout when not using PR number
complete -c gh -n "__fish_gh_using_subcommand pr; and __fish_seen_subcommand_from checkout" -f -a '(__fish_gh_complete_branches)'

# Complete PR numbers for checks command
complete -c gh -n "__fish_gh_using_subcommand pr; and __fish_seen_subcommand_from checks" -f -a '(__fish_gh_complete_prs)'

# Add --repo flag completion for pr commands
complete -c gh -n "__fish_gh_using_subcommand pr" -s R -l repo -f -a '(__fish_gh_complete_repos)' -d 'Select another repository'