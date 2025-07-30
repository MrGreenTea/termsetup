# ABOUTME: Completions for jj bookmark subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "create" -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "c" -d 'Create a new bookmark'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "delete" -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "d" -d 'Delete an existing bookmark and propagate the deletion to remotes on the next push'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "forget" -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "f" -d 'Forget a bookmark without marking it as a deletion to be pushed'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "list" -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "l" -d 'List bookmarks and their targets'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "move" -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "m" -d 'Move existing bookmarks to target revision'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "rename" -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "r" -d 'Rename `old` bookmark name to `new` bookmark name'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "set" -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "s" -d 'Create or update a bookmark to point to a certain commit'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "track" -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "t" -d 'Start tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and not __fish_seen_subcommand_from create c delete d forget f list l move m rename r set s track t untrack" -f -a "untrack" -d 'Stop tracking given remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from c" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from delete" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from d" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from forget" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l include-remotes -d 'When forgetting a local bookmark, also forget any corresponding remote bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from f" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l remote -d 'Show all tracking and non-tracking remote bookmarks belonging to this remote' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s r -l revisions -d 'Show bookmarks whose local targets are in the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s T -l template -d 'Render each bookmark using the given template' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l sort -d 'Sort bookmarks based on the given key (or multiple keys)' -r -f -a "name\t''
name-\t''
author-name\t''
author-name-\t''
author-email\t''
author-email-\t''
author-date\t''
author-date-\t''
committer-name\t''
committer-name-\t''
committer-email\t''
committer-email-\t''
committer-date\t''
committer-date-\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s a -l all-remotes -d 'Show all tracking and non-tracking remote bookmarks including the ones whose targets are synchronized with the local bookmarks'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s t -l tracked -d 'Show remote tracked bookmarks only. Omits local Git-tracking bookmarks by default'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s c -l conflicted -d 'Show conflicted bookmarks only'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from l" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from move" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s f -l from -d 'Move bookmarks from the given revisions' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s t -l to -d 'Move bookmarks to this revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s B -l allow-backwards -d 'Allow moving bookmarks backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from m" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from rename" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from r" -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s r -l revision -l to -d 'The bookmark\'s target revision' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s B -l allow-backwards -d 'Allow moving the bookmark backwards or sideways'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from s" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from track" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from t" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand bookmark; and __fish_seen_subcommand_from untrack" -s h -l help -d 'Print help (see more with \'--help\')'
