# ABOUTME: Completions for jj util subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "completion" -d 'Print a command-line-completion script'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "config-schema" -d 'Print the JSON schema for the jj TOML config format'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "exec" -d 'Execute an external command via jj'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "gc" -d 'Run backend-dependent garbage collection'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "install-man-pages" -d 'Install Jujutsu\'s manpages to the provided path'
complete -c jj -n "__fish_jj_using_subcommand util; and not __fish_seen_subcommand_from completion config-schema exec gc install-man-pages markdown-help" -f -a "markdown-help" -d 'Print the CLI help for all subcommands in Markdown'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from config-schema" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l expire -d 'Time threshold' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from gc" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from install-man-pages" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand util; and __fish_seen_subcommand_from markdown-help" -s h -l help -d 'Print help (see more with \'--help\')'
