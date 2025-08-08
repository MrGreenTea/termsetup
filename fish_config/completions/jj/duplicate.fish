# ABOUTME: Completions for jj duplicate subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand duplicate" -s r -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s d -l destination -d 'The revision(s) to duplicate onto (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand duplicate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand duplicate" --keep-order -f -a "(__fish_jj_complete_revisions)"
