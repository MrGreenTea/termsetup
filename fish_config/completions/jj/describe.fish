# ABOUTME: Completions for jj describe subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand describe" -s r -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand describe" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand describe" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand describe" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand describe" -l stdin -d 'Read the change description from stdin'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-edit -d 'Don\'t open an editor'
complete -c jj -n "__fish_jj_using_subcommand describe" -l edit -d 'Open an editor'
complete -c jj -n "__fish_jj_using_subcommand describe" -l reset-author -d 'Reset the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand describe" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand describe" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand describe" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand describe" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand describe" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand describe" --keep-order -f -a "(__fish_jj_complete_revisions)"
