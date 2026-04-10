complete -c pet --no-files -x -a "
  clip\t'Copy the selected commands'
  configure\t'Edit config file'
  edit\t'Edit snippet file'
  exec\t'Run the selected commands'
  help\t'Help about any command'
  list\t'Show all snippets'
  new\t'Create a new snippet'
  search\t'Search snippets'
  sync\t'Sync snippets'
  version\t'Print the version number'
"

# #
# pet - Simple command-line snippet manager.
#
# Usage:
#   pet [command]
#
# Available Commands:
#   clip        Copy the selected commands
#   configure   Edit config file
#   edit        Edit snippet file
#   exec        Run the selected commands
#   help        Help about any command
#   list        Show all snippets
#   new         Create a new snippet
#   search      Search snippets
#   sync        Sync snippets
#   version     Print the version number
#
# Flags:
#       --config string   config file (default is $HOME/.config/pet/config.toml)
#       --debug           debug mode
#   -h, --help            help for pet
#
# Use "pet [command] --help" for more information about a command.
# #
