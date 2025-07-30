# ABOUTME: Completions for jj workspace subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "add" -d 'Add a workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "forget" -d 'Stop tracking a workspace\'s working-copy commit in the repo'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "list" -d 'List workspaces'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "rename" -d 'Renames the current workspace'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "root" -d 'Show the current workspace root directory'
complete -c jj -n "__fish_jj_using_subcommand workspace; and not __fish_seen_subcommand_from add forget list rename root update-stale" -f -a "update-stale" -d 'Update a workspace that has become stale'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l name -d 'A name for the workspace' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s r -l revision -d 'A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l sparse-patterns -d 'How to handle sparse patterns when creating a new workspace' -r -f -a "copy\t'Copy all sparse patterns from the current workspace'
full\t'Include all files in the new workspace'
empty\t'Clear all files from the workspace (it will be empty)'"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand workspace; and __fish_seen_subcommand_from update-stale" -s h -l help -d 'Print help (see more with \'--help\')'
