# ABOUTME: Completions for jj squash subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand squash" -s r -l revision -d 'Revision to squash into its parent (default: @)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand squash" -s f -l from -d 'Revision(s) to squash from (default: @)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand squash" -s t -l into -l to -d 'Revision to squash into (default: @)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand squash" -s m -l message -d 'The description to use for squashed revision (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l tool -d 'Specify diff editor to be used (implies --interactive)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand squash" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand squash" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand squash" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand squash" -s u -l use-destination-message -d 'Use the description of the destination revision and discard the description(s) of the source revision(s)'
complete -c jj -n "__fish_jj_using_subcommand squash" -s i -l interactive -d 'Interactively choose which parts to squash'
complete -c jj -n "__fish_jj_using_subcommand squash" -s k -l keep-emptied -d 'The source revision will not be abandoned'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand squash" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand squash" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand squash" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand squash" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand squash" -s h -l help -d 'Print help (see more with \'--help\')'
