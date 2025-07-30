# ABOUTME: Completions for jj revert subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand revert" -s r -l revisions -d 'The revision(s) to apply the reverse of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s d -l destination -d 'The revision(s) to apply the reverse changes on top of' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s A -l insert-after -l after -d 'The revision(s) to insert the reverse changes after (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s B -l insert-before -l before -d 'The revision(s) to insert the reverse changes before (can be repeated to create a merge commit)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand revert" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand revert" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand revert" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand revert" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand revert" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand revert" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand revert" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand revert" -s h -l help -d 'Print help (see more with \'--help\')'
