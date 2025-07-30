# ABOUTME: Completions for jj file subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "annotate" -d 'Show the source change for each line of the target file'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "chmod" -d 'Sets or removes the executable bit for paths in the repo'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "list" -d 'List files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "show" -d 'Print contents of files in a revision'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "track" -d 'Start tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and not __fish_seen_subcommand_from annotate chmod list show track untrack" -f -a "untrack" -d 'Stop tracking specified paths in the working copy'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s r -l revision -d 'an optional revision to start at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s T -l template -d 'Render each line using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from annotate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s r -l revision -d 'The revision to update' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from chmod" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s r -l revision -d 'The revision to list files in' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each file entry using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s r -l revision -d 'The revision to get the file contents from' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand file; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
