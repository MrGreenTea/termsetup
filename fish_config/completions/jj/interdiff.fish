# ABOUTME: Completions for jj interdiff subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand interdiff" -s f -l from -d 'Show changes from this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s t -l to -d 'Show changes to this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand interdiff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand interdiff" --keep-order -f -a "(__fish_jj_complete_revisions)"
