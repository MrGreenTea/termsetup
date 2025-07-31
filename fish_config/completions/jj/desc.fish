# ABOUTME: Duplicated completions for jj desc (alias of jj describe)
# ABOUTME: Auto-generated from jj help output and main command completions

complete -c jj -n "__fish_jj_using_subcommand desc" -s r -r
complete -c jj -n "__fish_jj_using_subcommand desc" -s m -l message -d 'The change description to use (don\'t open editor)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l author -d 'Set author to the provided string' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand desc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand desc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand desc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand desc" -l stdin -d 'Read the change description from stdin'
complete -c jj -n "__fish_jj_using_subcommand desc" -l no-edit -d 'Don\'t open an editor'
complete -c jj -n "__fish_jj_using_subcommand desc" -l edit -d 'Open an editor'
complete -c jj -n "__fish_jj_using_subcommand desc" -l reset-author -d 'Reset the author to the configured user'
complete -c jj -n "__fish_jj_using_subcommand desc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand desc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand desc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand desc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand desc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand desc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand desc" --keep-order -f -a "(__fish_jj_complete_revisions)"
