# ABOUTME: Completions for jj show subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand show" -s T -l template -d 'Render a revision using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand show" -s r -d 'Ignored (but lets you pass `-r` for consistency with other commands)'
complete -c jj -n "__fish_jj_using_subcommand show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-patch -d 'Do not show the patch'
complete -c jj -n "__fish_jj_using_subcommand show" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand show" --keep-order -f -a "(__fish_jj_complete_revisions)"
