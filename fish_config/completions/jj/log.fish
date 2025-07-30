# ABOUTME: Completions for jj log subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand log" -s r -l revisions -d 'Which revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand log" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-graph -d 'Don\'t show the graph, show a flat list of revisions'
complete -c jj -n "__fish_jj_using_subcommand log" -s p -l patch -d 'Show patch'
complete -c jj -n "__fish_jj_using_subcommand log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand log" -s h -l help -d 'Print help (see more with \'--help\')'
