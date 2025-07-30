# ABOUTME: Completions for jj git subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "clone" -d 'Create a new repo backed by a clone of a Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "export" -d 'Update the underlying Git repo with changes made in the repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "fetch" -d 'Fetch from a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "import" -d 'Update repo with changes made in the underlying Git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "init" -d 'Create a new Git backed repo'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "push" -d 'Push to a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "remote" -d 'Manage Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and not __fish_seen_subcommand_from clone export fetch import init push remote root" -f -a "root" -d 'Show the underlying Git directory of a repository using the Git backend'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l remote -d 'Name of the newly created remote' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l depth -d 'Create a shallow clone of the given depth' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l colocate -d 'Whether or not to colocate the Jujutsu repo with the git repo'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from clone" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from export" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s b -l branch -d 'Fetch only some of the branches' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l remote -d 'The remote to fetch from (only named remotes are supported, can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l all-remotes -d 'Fetch from all remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from fetch" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from import" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l git-repo -d 'Specifies a path to an **existing** git repository to be used as the backing git repo for the newly created `jj` repo' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l colocate -d 'Specifies that the `jj` repo should also be a valid `git` repo, allowing the use of both `jj` and `git` commands in the same directory'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from init" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l remote -d 'The remote to push to (only named remotes are supported)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s b -l bookmark -d 'Push only this bookmark, or bookmarks matching a pattern (can be repeated)' -r -f -a "(__fish_jj_complete_bookmark_names)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s r -l revisions -d 'Push bookmarks pointing to these commits (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s c -l change -d 'Push this commit by creating a bookmark (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l named -d 'Specify a new bookmark name and a revision to push under that name, e.g. \'--named myfeature=@\'' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l all -d 'Push all bookmarks (including new bookmarks)'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l tracked -d 'Push all tracked bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l deleted -d 'Push all deleted bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s N -l allow-new -d 'Allow pushing new bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-empty-description -d 'Allow pushing commits with empty descriptions'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l allow-private -d 'Allow pushing commits that are private'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l dry-run -d 'Only display what will change on the remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from push" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "add" -d 'Add a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "list" -d 'List Git remotes'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "remove" -d 'Remove a Git remote and forget its bookmarks'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "rename" -d 'Rename a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from remote" -f -a "set-url" -d 'Set the URL of a Git remote'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand git; and __fish_seen_subcommand_from root" -s h -l help -d 'Print help (see more with \'--help\')'
