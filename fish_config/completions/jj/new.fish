# ABOUTME: Completions for jj new subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand new" -s m -l message -d 'The change description to use' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s A -l insert-after -l after -d 'Insert the new change after the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s B -l insert-before -l before -d 'Insert the new change before the given commit(s)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand new" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand new" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand new" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand new" -s d -d 'Ignored (but lets you pass `-d`/`-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-edit -d 'Do not edit the newly created change'
complete -c jj -n "__fish_jj_using_subcommand new" -l edit -d 'No-op flag to pair with --no-edit'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand new" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand new" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand new" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand new" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand new" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand new" --keep-order -f -a "(__fish_jj_complete_revisions)"
