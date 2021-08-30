complete -c fnm -n "__fish_use_subcommand" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_use_subcommand" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_use_subcommand" -l multishell-path -d 'Where the current node version link is stored. This value will be populated automatically by evaluating `fnm env` in your shell profile. Read more about it using `fnm help env`'
complete -c fnm -n "__fish_use_subcommand" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_use_subcommand" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_use_subcommand" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_use_subcommand" -f -a "list-remote" -d 'List all remote Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "list" -d 'List all locally installed Node.js versions'
complete -c fnm -n "__fish_use_subcommand" -f -a "install" -d 'Install a new Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "use" -d 'Change Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "env" -d 'Print and set up required environment variables for fnm'
complete -c fnm -n "__fish_use_subcommand" -f -a "completions" -d 'Print shell completions to stdout'
complete -c fnm -n "__fish_use_subcommand" -f -a "alias" -d 'Alias a version to a common name'
complete -c fnm -n "__fish_use_subcommand" -f -a "default" -d 'Set a version as the default version'
complete -c fnm -n "__fish_use_subcommand" -f -a "current" -d 'Print the current Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "exec" -d 'Run a command within fnm context'
complete -c fnm -n "__fish_use_subcommand" -f -a "uninstall" -d 'Uninstall a Node.js version'
complete -c fnm -n "__fish_use_subcommand" -f -a "help" -d 'Prints this message or the help of the given subcommand(s)'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from list-remote" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from list" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from list" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from list" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from list" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from list" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from install" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from install" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from install" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from install" -l lts -d 'Install latest LTS'
complete -c fnm -n "__fish_seen_subcommand_from install" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from install" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from use" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from use" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from use" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from use" -l install-if-missing -d 'Install the version if it isn\'t installed yet'
complete -c fnm -n "__fish_seen_subcommand_from use" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from use" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from env" -l shell -d 'The shell syntax to use. Infers when missing' -r -f -a "bash zsh fish powershell"
complete -c fnm -n "__fish_seen_subcommand_from env" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from env" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from env" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from env" -l multi -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from env" -l use-on-cd -d 'Print the script to change Node versions every directory change'
complete -c fnm -n "__fish_seen_subcommand_from env" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from env" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l shell -d 'The shell syntax to use. Infers when missing' -r -f -a "zsh bash fish powershell elvish"
complete -c fnm -n "__fish_seen_subcommand_from completions" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from completions" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from completions" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from completions" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from alias" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from alias" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from alias" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from default" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from default" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from default" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from default" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from default" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from current" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from current" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from current" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from current" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from current" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using
complete -c fnm -n "__fish_seen_subcommand_from exec" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from exec" -l using-file -d 'Deprecated. This is the default now'
complete -c fnm -n "__fish_seen_subcommand_from exec" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from exec" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from uninstall" -s V -l version -d 'Prints version information'
complete -c fnm -n "__fish_seen_subcommand_from help" -l node-dist-mirror -d 'https://nodejs.org/dist/ mirror'
complete -c fnm -n "__fish_seen_subcommand_from help" -l fnm-dir -d 'The root directory of fnm installations'
complete -c fnm -n "__fish_seen_subcommand_from help" -l log-level -d 'The log level of fnm commands'
complete -c fnm -n "__fish_seen_subcommand_from help" -s h -l help -d 'Prints help information'
complete -c fnm -n "__fish_seen_subcommand_from help" -s V -l version -d 'Prints version information'
