# ABOUTME: Completions for jj undo subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand undo" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand undo" -s h -l help -d 'Print help (see more with \'--help\')'
