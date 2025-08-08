# ABOUTME: Completions for jj diff subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand diff" -s r -l revisions -d 'Show changes in these revisions' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diff" -s f -l from -d 'Show changes from this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diff" -s t -l to -d 'Show changes to this revision' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand diff" -s T -l template -d 'Render each file diff entry using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand diff" -s w -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -s b -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand diff" -s h -l help -d 'Print help (see more with \'--help\')'
# Complete fileset arguments - files that have changes in the specified revset
complete -c jj -n "__fish_jj_using_subcommand diff" --keep-order -f -a "(__fish_jj_complete_changed_files_in_revset)"
