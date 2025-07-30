# ABOUTME: Completions for jj op subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "abandon" -d 'Abandon operation history'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "diff" -d 'Compare changes to the repository between two operations'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "log" -d 'Show the operation log'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "restore" -d 'Create a new operation that restores the repo to an earlier state'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "show" -d 'Show changes to the repository in an operation'
complete -c jj -n "__fish_jj_using_subcommand op; and not __fish_seen_subcommand_from abandon diff log restore show undo" -f -a "undo" -d 'Create a new operation that undoes an earlier operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from abandon" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l operation -l op -d 'Show repository changes in this operation, compared to its parent' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s f -l from -d 'Show repository changes from this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s t -l to -d 'Show repository changes to this operation' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from diff" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s n -l limit -d 'Limit number of operations to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s T -l template -d 'Render each operation using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l reversed -d 'Show operations in the opposite order (older operations first)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-graph -d 'Don\'t show the graph, show a flat list of operations'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s d -l op-diff -d 'Show changes to the repository at each operation'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s p -l patch -d 'Show patch of modifications to changes (implies --op-diff)'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from log" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from restore" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l tool -d 'Generate diff by external command' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l context -d 'Number of lines of context to show' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-graph -d 'Don\'t show the graph, show a flat list of modified changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s p -l patch -d 'Show patch of modifications to changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s s -l summary -d 'For each path, show only whether it was modified, added, or deleted'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l stat -d 'Show a histogram of the changes'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l types -d 'For each path, show only its type before and after'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l name-only -d 'For each path, show only its path'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l git -d 'Show a Git-format diff'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l color-words -d 'Show a word-level diff with changes indicated only by color'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-all-space -d 'Ignore whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-space-change -d 'Ignore changes in amount of whitespace when comparing lines'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l what -d 'What portions of the local state to restore (can be repeated)' -r -f -a "repo\t'The jj repo state and local bookmarks'
remote-tracking\t'The remote-tracking bookmarks. Do not restore these if you\'d like to push after the undo'"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand op; and __fish_seen_subcommand_from undo" -s h -l help -d 'Print help (see more with \'--help\')'
