# ABOUTME: Completions for jj fix subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand fix" -s s -l source -d 'Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the `revsets.fix` setting, or `reachable(@, mutable())` if it is not set' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand fix" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand fix" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand fix" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand fix" -l include-unchanged-files -d 'Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand fix" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand fix" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand fix" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand fix" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand fix" -s h -l help -d 'Print help (see more with \'--help\')'
