# ABOUTME: Completions for jj config subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "edit" -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "e" -d 'Start an editor on a jj config file'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "get" -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "g" -d 'Get the value of a given config option.'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "list" -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "l" -d 'List variables set in config files, along with their values'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "path" -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "p" -d 'Print the paths to the config files'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "set" -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "s" -d 'Update a config file to set the given option to a given value'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "unset" -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and not __fish_seen_subcommand_from edit e get g list l path p set s unset u" -f -a "u" -d 'Update a config file to unset the given option'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from e" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from g" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each variable using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-defaults -d 'Whether to explicitly include built-in default values in the list'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l include-overridden -d 'Allow printing overridden values'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from path" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from p" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l user -d 'Target the user-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l repo -d 'Target the repo-level config'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand config; and __fish_seen_subcommand_from u" -s h -l help -d 'Print help (see more with \'--help\')'
