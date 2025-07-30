# ABOUTME: Completions for jj next subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand next" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand next" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand next" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand next" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand next" -s e -l edit -d 'Instead of creating a new working-copy commit on top of the target commit (like `jj new`), edit the target commit directly (like `jj edit`)'
complete -c jj -n "__fish_jj_using_subcommand next" -s n -l no-edit -d 'The inverse of `--edit`'
complete -c jj -n "__fish_jj_using_subcommand next" -l conflict -d 'Jump to the next conflicted descendant'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand next" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand next" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand next" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand next" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand next" -s h -l help -d 'Print help (see more with \'--help\')'
