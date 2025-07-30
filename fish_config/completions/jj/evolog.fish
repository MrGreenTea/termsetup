# ABOUTME: Completions for jj evolog subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand evolog" -s r -l revisions -d 'Follow changes from these revisions' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s n -l limit -d 'Limit number of revisions to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s T -l template -d 'Render each revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand evolog" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand evolog" -l reversed -d 'Show revisions in the opposite order (older revisions first)'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-graph -d 'Don\'t show the graph, show a flat list of revisions'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s p -l patch -d 'Show patch compared to the previous version of this change'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand evolog" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand evolog" -s h -l help -d 'Print help (see more with \'--help\')'
