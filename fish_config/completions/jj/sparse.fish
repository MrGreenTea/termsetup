# ABOUTME: Completions for jj sparse subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "edit" -d 'Start an editor to update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "list" -d 'List the patterns that are currently present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "reset" -d 'Reset the patterns to include all files in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and not __fish_seen_subcommand_from edit list reset set" -f -a "set" -d 'Update the patterns that are present in the working copy'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from edit" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from reset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l add -d 'Patterns to add to the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l remove -d 'Patterns to remove from the working copy' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l clear -d 'Include no files in the working copy (combine with --add)'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand sparse; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
