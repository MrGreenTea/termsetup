# ABOUTME: Completions for jj restore subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand restore" -s f -l from -d 'Revision to restore from (source)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand restore" -s t -l into -l to -d 'Revision to restore into (destination)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand restore" -s c -l changes-in -d 'Undo the changes in a revision as compared to the merge of its parents' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand restore" -s r -l revision -d 'Prints an error. DO NOT USE' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand restore" -s i -l interactive -d 'Interactively choose which parts to restore'
complete -c jj -n "__fish_jj_using_subcommand restore" -l restore-descendants -d 'Preserve the content (not the diff) when rebasing descendants'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand restore" -s h -l help -d 'Print help (see more with \'--help\')'
