complete -c rtx -n "__fish_use_subcommand" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_use_subcommand" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_use_subcommand" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_use_subcommand" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_use_subcommand" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_use_subcommand" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_use_subcommand" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_use_subcommand" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c rtx -n "__fish_use_subcommand" -f -a "activate" -d 'Initializes rtx in the current shell'
complete -c rtx -n "__fish_use_subcommand" -f -a "alias" -d 'Manage aliases'
complete -c rtx -n "__fish_use_subcommand" -f -a "asdf" -d '[internal] simulates asdf for plugins that call "asdf" internally'
complete -c rtx -n "__fish_use_subcommand" -f -a "bin-paths" -d 'List all the active runtime bin paths'
complete -c rtx -n "__fish_use_subcommand" -f -a "cache" -d 'Manage the rtx cache'
complete -c rtx -n "__fish_use_subcommand" -f -a "completion" -d 'Generate shell completions'
complete -c rtx -n "__fish_use_subcommand" -f -a "current" -d 'Shows current active and installed runtime versions'
complete -c rtx -n "__fish_use_subcommand" -f -a "deactivate" -d 'Disable rtx for current shell session'
complete -c rtx -n "__fish_use_subcommand" -f -a "direnv" -d 'Output direnv function to use rtx inside direnv'
complete -c rtx -n "__fish_use_subcommand" -f -a "doctor" -d 'Check rtx installation for possible problems.'
complete -c rtx -n "__fish_use_subcommand" -f -a "env" -d 'Exports env vars to activate rtx a single time'
complete -c rtx -n "__fish_use_subcommand" -f -a "exec" -d 'Execute a command with tool(s) set'
complete -c rtx -n "__fish_use_subcommand" -f -a "global" -d 'Sets/gets the global tool version(s)'
complete -c rtx -n "__fish_use_subcommand" -f -a "hook-env" -d '[internal] called by activate hook to update env vars directory change'
complete -c rtx -n "__fish_use_subcommand" -f -a "implode" -d 'Removes rtx CLI and all related data'
complete -c rtx -n "__fish_use_subcommand" -f -a "install" -d 'Install a tool version'
complete -c rtx -n "__fish_use_subcommand" -f -a "latest" -d 'Gets the latest available version for a plugin'
complete -c rtx -n "__fish_use_subcommand" -f -a "local" -d 'Sets/gets tool version in local .tool-versions or .rtx.toml'
complete -c rtx -n "__fish_use_subcommand" -f -a "ls" -d 'List installed and/or currently selected tool versions'
complete -c rtx -n "__fish_use_subcommand" -f -a "ls-remote" -d 'List runtime versions available for install'
complete -c rtx -n "__fish_use_subcommand" -f -a "plugins" -d 'Manage plugins'
complete -c rtx -n "__fish_use_subcommand" -f -a "prune" -d 'Delete unused versions of tools'
complete -c rtx -n "__fish_use_subcommand" -f -a "reshim" -d 'rebuilds the shim farm'
complete -c rtx -n "__fish_use_subcommand" -f -a "self-update" -d 'Updates rtx itself'
complete -c rtx -n "__fish_use_subcommand" -f -a "settings" -d 'Manage settings'
complete -c rtx -n "__fish_use_subcommand" -f -a "shell" -d 'Sets a tool version for the current shell session'
complete -c rtx -n "__fish_use_subcommand" -f -a "trust" -d 'Marks a config file as trusted'
complete -c rtx -n "__fish_use_subcommand" -f -a "uninstall" -d 'Removes runtime versions'
complete -c rtx -n "__fish_use_subcommand" -f -a "use" -d 'Change the active version of a tool locally or globally.'
complete -c rtx -n "__fish_use_subcommand" -f -a "version" -d 'Show rtx version'
complete -c rtx -n "__fish_use_subcommand" -f -a "where" -d 'Display the installation path for a runtime'
complete -c rtx -n "__fish_use_subcommand" -f -a "which" -d 'Shows the path that a bin name points to'
complete -c rtx -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from activate" -s s -l shell -d 'Shell type to generate the script for' -r -f -a "{bash	,fish	,nu	,xonsh	,zsh	}"
complete -c rtx -n "__fish_seen_subcommand_from activate" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from activate" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from activate" -l status -d 'Show "rtx: <PLUGIN>@<VERSION>" message when changing directories'
complete -c rtx -n "__fish_seen_subcommand_from activate" -s q -l quiet -d 'noop'
complete -c rtx -n "__fish_seen_subcommand_from activate" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from activate" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from activate" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from activate" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from activate" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from activate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s p -l plugin -d 'filter aliases by plugin' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "get" -d 'Show an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "set" -d 'Add/update an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "unset" -d 'Clears an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -s p -l plugin -d 'Show aliases for <PLUGIN>' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "get" -d 'Show an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "set" -d 'Add/update an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "unset" -d 'Clears an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from alias; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from asdf" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from asdf" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from asdf" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from bin-paths" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -f -a "clear" -d 'Deletes all cache files in rtx'
complete -c rtx -n "__fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from clear" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -f -a "clear" -d 'Deletes all cache files in rtx'
complete -c rtx -n "__fish_seen_subcommand_from cache; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from clear; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from completion" -s s -l shell -d 'Shell type to generate completions for' -r -f -a "{bash	,elvish	,fish	,powershell	,zsh	}"
complete -c rtx -n "__fish_seen_subcommand_from completion" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from completion" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from completion" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from completion" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from completion" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from completion" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from completion" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from completion" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from current" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from current" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from current" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from current" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from current" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from current" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from current" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from current" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from deactivate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "envrc" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "exec" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "activate" -d 'Output direnv function to use rtx inside direnv'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from envrc" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from exec" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from activate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "envrc" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "exec" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "activate" -d 'Output direnv function to use rtx inside direnv'
complete -c rtx -n "__fish_seen_subcommand_from direnv; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from doctor" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from doctor" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from doctor" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from env" -s s -l shell -d 'Shell type to generate environment variables for' -r -f -a "{bash	,fish	,nu	,xonsh	,zsh	}"
complete -c rtx -n "__fish_seen_subcommand_from env" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from env" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from env" -l json -d 'Output in JSON format'
complete -c rtx -n "__fish_seen_subcommand_from env" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from env" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from env" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from env" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from env" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from env" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from exec" -s c -l command -d 'Command string to execute' -r -f -a "(__fish_complete_command)"
complete -c rtx -n "__fish_seen_subcommand_from exec" -l cd -d 'Change to this directory before executing the command' -r -f -a "(__fish_complete_directories)"
complete -c rtx -n "__fish_seen_subcommand_from exec" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from exec" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from exec" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from exec" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from exec" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from exec" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from exec" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from exec" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from global" -l remove -d 'Remove the plugin(s) from ~/.tool-versions' -r
complete -c rtx -n "__fish_seen_subcommand_from global" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from global" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from global" -l pin -d 'Save exact version to `~/.tool-versions`
e.g.: `rtx global --pin node@20` will save `node 20.0.0` to ~/.tool-versions'
complete -c rtx -n "__fish_seen_subcommand_from global" -l fuzzy -d 'Save fuzzy version to `~/.tool-versions`
e.g.: `rtx global --fuzzy node@20` will save `node 20` to ~/.tool-versions
this is the default behavior unless RTX_ASDF_COMPAT=1'
complete -c rtx -n "__fish_seen_subcommand_from global" -l path -d 'Get the path of the global config file'
complete -c rtx -n "__fish_seen_subcommand_from global" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from global" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from global" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from global" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from global" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from global" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -s s -l shell -d 'Shell type to generate script for' -r -f -a "{bash	,fish	,nu	,xonsh	,zsh	}"
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -l status -d 'Show "rtx: <PLUGIN>@<VERSION>" message when changing directories'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from hook-env" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from implode" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from implode" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from implode" -l config -d 'Also remove config directory'
complete -c rtx -n "__fish_seen_subcommand_from implode" -l dry-run -d 'List directories that would be removed without actually removing them'
complete -c rtx -n "__fish_seen_subcommand_from implode" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from implode" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from implode" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from implode" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from implode" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from implode" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from install" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from install" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from install" -s f -l force -d 'Force reinstall even if already installed'
complete -c rtx -n "__fish_seen_subcommand_from install" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from install" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from install" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from install" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from install" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from latest" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from latest" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from latest" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from latest" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from latest" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from latest" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from latest" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from latest" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from local" -l remove -d 'Remove the plugin(s) from .tool-versions' -r
complete -c rtx -n "__fish_seen_subcommand_from local" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from local" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from local" -s p -l parent -d 'Recurse up to find a .tool-versions file rather than using the current directory only
by default this command will only set the tool in the current directory ("$PWD/.tool-versions")'
complete -c rtx -n "__fish_seen_subcommand_from local" -l pin -d 'Save exact version to `.tool-versions`
e.g.: `rtx local --pin node@20` will save `node 20.0.0` to .tool-versions'
complete -c rtx -n "__fish_seen_subcommand_from local" -l fuzzy -d 'Save fuzzy version to `.tool-versions` e.g.: `rtx local --fuzzy node@20` will save `node 20` to .tool-versions This is the default behavior unless RTX_ASDF_COMPAT=1'
complete -c rtx -n "__fish_seen_subcommand_from local" -l path -d 'Get the path of the config file'
complete -c rtx -n "__fish_seen_subcommand_from local" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from local" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from local" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from local" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from local" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from local" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from ls" -s p -l plugin -d 'Only show tool versions from [PLUGIN]' -r
complete -c rtx -n "__fish_seen_subcommand_from ls" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from ls" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from ls" -s c -l current -d 'Only show tool versions currently specified in a .tool-versions/.rtx.toml'
complete -c rtx -n "__fish_seen_subcommand_from ls" -s i -l installed -d 'Only show tool versions that are installed Hides missing ones defined in .tool-versions/.rtx.toml but not yet installed'
complete -c rtx -n "__fish_seen_subcommand_from ls" -l parseable -d 'Output in an easily parseable format'
complete -c rtx -n "__fish_seen_subcommand_from ls" -l json -d 'Output in json format'
complete -c rtx -n "__fish_seen_subcommand_from ls" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from ls" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from ls" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from ls" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from ls" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from ls-remote" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s a -l all -d 'list all available remote plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s c -l core -d 'The built-in plugins only
Normally these are not shown'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s u -l urls -d 'show the git url for each plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "install" -d 'Install a plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "link" -d 'Symlinks a plugin into rtx'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'List installed plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "ls-remote" -d 'List all available remote plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Removes a plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "update" -d 'Updates a plugin to the latest version'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s f -l force -d 'Reinstall even if plugin exists'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s a -l all -d 'Install all missing plugins
This will only install plugins that have matching shorthands.
i.e.: they don\'t need the full git repo url'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -s f -l force -d 'Overwrite existing plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from link" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s a -l all -d 'List all available remote plugins
Same as `rtx plugins ls-remote`'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s c -l core -d 'The built-in plugins only
Normally these are not shown'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s u -l urls -d 'Show the git url for each plugin
e.g.: https://github.com/asdf-vm/asdf-node.git'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -s u -l urls -d 'Show the git url for each plugin e.g.: https://github.com/rtx-plugins/rtx-nodejs.git'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -l only-names -d 'Only show the name of each plugin by default it will show a "*" next to installed plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from ls-remote" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -s a -l all -d 'Update all plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "install" -d 'Install a plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "link" -d 'Symlinks a plugin into rtx'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'List installed plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "ls-remote" -d 'List all available remote plugins'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Removes a plugin'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "update" -d 'Updates a plugin to the latest version'
complete -c rtx -n "__fish_seen_subcommand_from plugins; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from prune" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from prune" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from prune" -l dry-run -d 'Do not actually delete anything'
complete -c rtx -n "__fish_seen_subcommand_from prune" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from prune" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from prune" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from prune" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from prune" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from prune" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from reshim" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from reshim" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from reshim" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from self-update" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from self-update" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from self-update" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "get" -d 'Show a current setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'Show current settings'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "set" -d 'Add/update a setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "unset" -d 'Clears a setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from get" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from ls" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "get" -d 'Show a current setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'Show current settings'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "set" -d 'Add/update a setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "unset" -d 'Clears a setting'
complete -c rtx -n "__fish_seen_subcommand_from settings; and __fish_seen_subcommand_from help; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from shell" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from shell" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from shell" -s u -l unset -d 'Removes a previously set version'
complete -c rtx -n "__fish_seen_subcommand_from shell" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from shell" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from shell" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from shell" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from shell" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from shell" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from trust" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from trust" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from trust" -l untrust -d 'No longer trust this config'
complete -c rtx -n "__fish_seen_subcommand_from trust" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from trust" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from trust" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from trust" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from trust" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from trust" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from use" -l remove -d 'Remove the tool(s) from config file' -r
complete -c rtx -n "__fish_seen_subcommand_from use" -s p -l path -d 'Specify a path to a config file' -r -F
complete -c rtx -n "__fish_seen_subcommand_from use" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from use" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from use" -l pin -d 'Save exact version to config file
e.g.: `rtx use --pin node@20` will save `node 20.0.0` to ~/.tool-versions'
complete -c rtx -n "__fish_seen_subcommand_from use" -l fuzzy -d 'Save fuzzy version to config file
e.g.: `rtx use --fuzzy node@20` will save `node 20` to ~/.tool-versions
this is the default behavior unless RTX_ASDF_COMPAT=1'
complete -c rtx -n "__fish_seen_subcommand_from use" -s g -l global -d 'Use the global config file (~/.config/rtx/config.toml) instead of the local one'
complete -c rtx -n "__fish_seen_subcommand_from use" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from use" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from use" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from use" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from use" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from use" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from version" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from version" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from version" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from version" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from version" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from version" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from version" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from version" -s h -l help -d 'Print help'
complete -c rtx -n "__fish_seen_subcommand_from where" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from where" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from where" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from where" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from where" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from where" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from where" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from where" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from which" -s j -l jobs -d 'Number of plugins and runtimes to install in parallel
default: 4' -r
complete -c rtx -n "__fish_seen_subcommand_from which" -l log-level -d 'Set the log output verbosity' -r
complete -c rtx -n "__fish_seen_subcommand_from which" -l plugin -d 'Show the plugin name instead of the path'
complete -c rtx -n "__fish_seen_subcommand_from which" -l version -d 'Show the version instead of the path'
complete -c rtx -n "__fish_seen_subcommand_from which" -l debug -d 'Sets log level to debug'
complete -c rtx -n "__fish_seen_subcommand_from which" -l install-missing -d 'Automatically install missing tools'
complete -c rtx -n "__fish_seen_subcommand_from which" -s r -l raw -d 'Directly pipe stdin/stdout/stderr to user.
Sets --jobs=1'
complete -c rtx -n "__fish_seen_subcommand_from which" -l trace -d 'Sets log level to trace'
complete -c rtx -n "__fish_seen_subcommand_from which" -s v -l verbose -d 'Show installation output'
complete -c rtx -n "__fish_seen_subcommand_from which" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "activate" -d 'Initializes rtx in the current shell'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "alias" -d 'Manage aliases'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "asdf" -d '[internal] simulates asdf for plugins that call "asdf" internally'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "bin-paths" -d 'List all the active runtime bin paths'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "cache" -d 'Manage the rtx cache'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "completion" -d 'Generate shell completions'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "current" -d 'Shows current active and installed runtime versions'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "deactivate" -d 'Disable rtx for current shell session'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "direnv" -d 'Output direnv function to use rtx inside direnv'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "doctor" -d 'Check rtx installation for possible problems.'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "env" -d 'Exports env vars to activate rtx a single time'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "exec" -d 'Execute a command with tool(s) set'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "global" -d 'Sets/gets the global tool version(s)'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "hook-env" -d '[internal] called by activate hook to update env vars directory change'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "implode" -d 'Removes rtx CLI and all related data'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "install" -d 'Install a tool version'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "latest" -d 'Gets the latest available version for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "local" -d 'Sets/gets tool version in local .tool-versions or .rtx.toml'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "ls" -d 'List installed and/or currently selected tool versions'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "ls-remote" -d 'List runtime versions available for install'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "plugins" -d 'Manage plugins'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "prune" -d 'Delete unused versions of tools'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "reshim" -d 'rebuilds the shim farm'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "self-update" -d 'Updates rtx itself'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "settings" -d 'Manage settings'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "shell" -d 'Sets a tool version for the current shell session'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "trust" -d 'Marks a config file as trusted'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "uninstall" -d 'Removes runtime versions'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "use" -d 'Change the active version of a tool locally or globally.'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "version" -d 'Show rtx version'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "where" -d 'Display the installation path for a runtime'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "which" -d 'Shows the path that a bin name points to'
complete -c rtx -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from activate; and not __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from asdf; and not __fish_seen_subcommand_from bin-paths; and not __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from completion; and not __fish_seen_subcommand_from current; and not __fish_seen_subcommand_from deactivate; and not __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from doctor; and not __fish_seen_subcommand_from env; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from global; and not __fish_seen_subcommand_from hook-env; and not __fish_seen_subcommand_from implode; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from latest; and not __fish_seen_subcommand_from local; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from prune; and not __fish_seen_subcommand_from reshim; and not __fish_seen_subcommand_from self-update; and not __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from shell; and not __fish_seen_subcommand_from trust; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from use; and not __fish_seen_subcommand_from version; and not __fish_seen_subcommand_from where; and not __fish_seen_subcommand_from which; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "get" -d 'Show an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "ls" -d 'List aliases
Shows the aliases that can be specified.
These can come from user config or from plugins in `bin/list-aliases`.'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "set" -d 'Add/update an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from alias; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "unset" -d 'Clears an alias for a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from cache; and not __fish_seen_subcommand_from clear" -f -a "clear" -d 'Deletes all cache files in rtx'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate" -f -a "envrc" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate" -f -a "exec" -d '[internal] This is an internal command that writes an envrc file
for direnv to consume.'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from direnv; and not __fish_seen_subcommand_from envrc; and not __fish_seen_subcommand_from exec; and not __fish_seen_subcommand_from activate" -f -a "activate" -d 'Output direnv function to use rtx inside direnv'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "install" -d 'Install a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "link" -d 'Symlinks a plugin into rtx'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "ls" -d 'List installed plugins'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "ls-remote" -d 'List all available remote plugins'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "uninstall" -d 'Removes a plugin'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from plugins; and not __fish_seen_subcommand_from install; and not __fish_seen_subcommand_from link; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from ls-remote; and not __fish_seen_subcommand_from uninstall; and not __fish_seen_subcommand_from update" -f -a "update" -d 'Updates a plugin to the latest version'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "get" -d 'Show a current setting'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "ls" -d 'Show current settings'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "set" -d 'Add/update a setting'
complete -c rtx -n "__fish_seen_subcommand_from help; and __fish_seen_subcommand_from settings; and not __fish_seen_subcommand_from get; and not __fish_seen_subcommand_from ls; and not __fish_seen_subcommand_from set; and not __fish_seen_subcommand_from unset" -f -a "unset" -d 'Clears a setting'

function __fish_rtx_list_all -a plugin
    rtx ls-remote $plugin 2>/dev/null
end

function __fish_rtx_arg_at -a number
    set -l cmd (commandline -opc)
    echo $cmd[$number]
end
set -l plugin_commands current global install latest local ls ls-remote prune uninstall # etc.
complete -c rtx -n "__fish_seen_subcommand_from $plugin_commands" -f -a '(rtx plugins)'
complete -c rtx -n '__fish_seen_subcommand_from (rtx plugins)' -f -a '(__fish_rtx_list_all (__fish_rtx_arg_at 3))'
