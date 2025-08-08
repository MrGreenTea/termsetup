# ABOUTME: Completions for jj rebase subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand rebase" -s b -l branch -d 'Rebase the whole branch relative to destination\'s ancestors (can be repeated)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s s -l source -d 'Rebase specified revision(s) together with their trees of descendants (can be repeated)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s r -l revisions -d 'Rebase the given revisions, rebasing descendants onto this revision\'s parent(s)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s d -l destination -d 'The revision(s) to rebase onto (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s A -l insert-after -l after -d 'The revision(s) to insert after (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s B -l insert-before -l before -d 'The revision(s) to insert before (can be repeated to create a merge commit)' -r --keep-order -f -a "(__fish_jj_complete_revisions)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand rebase" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand rebase" -l skip-emptied -d 'If true, when rebasing would produce an empty commit, the commit is abandoned. It will not be abandoned if it was already empty before the rebase. Will never skip merge commits with multiple non-empty parents'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l keep-divergent -d 'Keep divergent commits while rebasing'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand rebase" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand rebase" -s h -l help -d 'Print help (see more with \'--help\')'
