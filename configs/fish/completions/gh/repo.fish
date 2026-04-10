# ABOUTME: Enhanced completions for gh repo subcommands
# ABOUTME: Provides context-aware repository completion for clone and other repo operations

# Enhanced completion for gh repo clone with repository suggestions
complete -c gh -n "__fish_gh_using_subcommand repo; and __fish_seen_subcommand_from clone" -f -a '(__fish_gh_complete_repos)'

# Enhanced completion for gh repo view with repository suggestions
complete -c gh -n "__fish_gh_using_subcommand repo; and __fish_seen_subcommand_from view" -f -a '(__fish_gh_complete_repos)'

# Enhanced completion for gh repo fork with repository suggestions
complete -c gh -n "__fish_gh_using_subcommand repo; and __fish_seen_subcommand_from fork" -f -a '(__fish_gh_complete_repos)'