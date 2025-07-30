# ABOUTME: Completions for jj debug subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "copy-detection" -d 'Show information about file copies detected'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "fileset" -d 'Parse fileset expression'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "index" -d 'Show commit index stats'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "init-simple" -d 'Create a new repo in the given directory using the proof-of-concept simple backend'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "local-working-copy" -d 'Show information about the local working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "operation" -d 'Show information about an operation and its view'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "view" -d 'Show information about an operation and its view'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "reindex" -d 'Rebuild commit index'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "revset" -d 'Evaluate revset to full commit IDs'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "snapshot" -d 'Trigger a snapshot in the op log'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "template" -d 'Parse a template'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "tree" -d 'List the recursive entries of a tree'
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "watchman"
complete -c jj -n "__fish_jj_using_subcommand debug; and not __fish_seen_subcommand_from copy-detection fileset index init-simple local-working-copy operation view reindex revset snapshot template tree watchman working-copy" -f -a "working-copy" -d 'Show information about the working copy state'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from copy-detection" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from fileset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from index" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from init-simple" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from local-working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l display -r -f -a "operation\t'Show only the operation details'
id\t'Show the operation id only'
view\t'Show only the view details'
all\t'Show both the view and the operation'"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from operation" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l display -r -f -a "operation\t'Show only the operation details'
id\t'Show the operation id only'
view\t'Show only the view details'
all\t'Show both the view and the operation'"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from reindex" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-resolve -d 'Do not resolve and evaluate expression'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-optimize -d 'Do not rewrite expression to optimized form'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from revset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from snapshot" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from template" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s r -l revision -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l id -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l dir -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from tree" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "status" -d 'Check whether `watchman` is enabled and whether it\'s correctly installed'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "query-clock"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "query-changed-files"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from watchman" -f -a "reset-clock"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand debug; and __fish_seen_subcommand_from working-copy" -s h -l help -d 'Print help (see more with \'--help\')'
