# ABOUTME: Completions for jj sign subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand sign" -s r -l revisions -d 'What revision(s) to sign' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l key -d 'The key used for signing' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sign" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sign" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sign" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sign" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sign" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sign" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sign" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sign" -s h -l help -d 'Print help (see more with \'--help\')'
