# ABOUTME: Completions for jj split subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand split" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s r -l revision -d 'The revision to split' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand split" -s d -l destination -d 'The revision(s) to rebase onto (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand split" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand split" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand split" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand split" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand split" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand split" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand split" -s i -l interactive -d 'Interactively choose which parts to split'
complete -c jj -n "__fish_jj_using_subcommand split" -s p -l parallel -d 'Split the revision into two parallel revisions instead of a parent and child'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand split" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand split" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand split" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand split" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand split" -s h -l help -d 'Print help (see more with \'--help\')'
