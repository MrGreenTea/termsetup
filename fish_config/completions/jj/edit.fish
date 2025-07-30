# ABOUTME: Completions for jj edit subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand edit" -s r -d 'Ignored (but lets you pass `-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand edit" --keep-order -f -a "(__fish_jj_complete_revisions)"
