# ABOUTME: Completions for jj abandon subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand abandon" -s r -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand abandon" -s s -l summary
complete -c jj -n "__fish_jj_using_subcommand abandon" -l retain-bookmarks -d 'Do not delete bookmarks pointing to the revisions to abandon'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l restore-descendants -d 'Do not modify the content of the children of the abandoned commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand abandon" --keep-order -f -a "(__fish_jj_complete_revisions)"
