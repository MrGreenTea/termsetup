# ABOUTME: Completions for jj help subcommand
# ABOUTME: Auto-generated from jj util completion fish

complete -c jj -n "__fish_jj_using_subcommand help" -s k -l keyword -d 'Show help for keywords instead of commands' -r -f -a "bookmarks\t'Named pointers to revisions (similar to Git\'s branches)'
config\t'How and where to set configuration options'
filesets\t'A functional language for selecting a set of files'
glossary\t'Definitions of various terms'
revsets\t'A functional language for selecting a set of revision'
templates\t'A functional language to customize command output'
tutorial\t'Show a tutorial to get started with jj'"
complete -c jj -n "__fish_jj_using_subcommand help" -s R -l repository -d 'Path to repository to operate on' -r -f -a "(__fish_complete_directories)"
complete -c jj -n "__fish_jj_using_subcommand help" -l at-operation -l at-op -d 'Operation to load the repo at' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l color -d 'When to colorize output' -r -f -a "always\t''
never\t''
debug\t''
auto\t''"
complete -c jj -n "__fish_jj_using_subcommand help" -l config -d 'Additional configuration options (can be repeated)' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l config-toml -d 'Additional configuration options (can be repeated) (DEPRECATED)' -r
complete -c jj -n "__fish_jj_using_subcommand help" -l config-file -d 'Additional configuration files (can be repeated)' -r -F
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-working-copy -d 'Don\'t snapshot the working copy, and don\'t update it'
complete -c jj -n "__fish_jj_using_subcommand help" -l ignore-immutable -d 'Allow rewriting immutable commits'
complete -c jj -n "__fish_jj_using_subcommand help" -l debug -d 'Enable debug logging'
complete -c jj -n "__fish_jj_using_subcommand help" -l quiet -d 'Silence non-primary command output'
complete -c jj -n "__fish_jj_using_subcommand help" -l no-pager -d 'Disable the pager'
complete -c jj -n "__fish_jj_using_subcommand help" -s h -l help -d 'Print help (see more with \'--help\')'
