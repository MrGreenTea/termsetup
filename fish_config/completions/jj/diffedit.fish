# ABOUTME: Completions for jj diffedit subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand diffedit" -s r -l revision -d 'The revision to touch up' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s f -l from -d 'Show changes from this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s t -l to -d 'Edit changes in this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l tool -d 'Specify diff editor to be used' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diffedit" -s h -l help -d 'Print help (see more with \'--help\')'
