# ABOUTME: Completions for jj tag subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -f -a "list" -d 'List tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and not __fish_seen_subcommand_from list l" -f -a "l" -d 'List tags'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each tag using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand tag; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
