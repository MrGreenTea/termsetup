# ABOUTME: Completions for jj prev subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand prev" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand prev" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand prev" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand prev" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand prev" -s e -l edit -d 'Edit the parent directly, instead of moving the working-copy commit'
complete -c jj -n "__fish_jj_using_subcommand prev" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand prev" -l conflict -d 'Jump to the previous conflicted ancestor'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand prev" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand prev" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand prev" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand prev" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand prev" -s h -l help -d 'Print help (see more with \'--help\')'
