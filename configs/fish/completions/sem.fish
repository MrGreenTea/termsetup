# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_sem_global_optspecs
	string join \n h/help V/version
end

function __fish_sem_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_sem_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_sem_using_subcommand
	set -l cmd (__fish_sem_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c sem -n "__fish_sem_needs_command" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_needs_command" -s V -l version -d 'Print version'
complete -c sem -n "__fish_sem_needs_command" -f -a "diff" -d 'Show semantic diff of changes (supports git diff syntax)'
complete -c sem -n "__fish_sem_needs_command" -f -a "impact" -d 'Show impact of changing an entity (deps, dependents, transitive impact, tests)'
complete -c sem -n "__fish_sem_needs_command" -f -a "blame" -d 'Show semantic blame — who last modified each entity'
complete -c sem -n "__fish_sem_needs_command" -f -a "log" -d 'Show evolution of an entity through git history'
complete -c sem -n "__fish_sem_needs_command" -f -a "entities" -d 'List entities in a file'
complete -c sem -n "__fish_sem_needs_command" -f -a "context" -d 'Show token-budgeted context for an entity'
complete -c sem -n "__fish_sem_needs_command" -f -a "verify" -d 'Verify function call arity across the codebase'
complete -c sem -n "__fish_sem_needs_command" -f -a "mcp" -d 'Start the MCP server (stdin/stdout transport)'
complete -c sem -n "__fish_sem_needs_command" -f -a "setup" -d 'Replace `git diff` with `sem diff` globally'
complete -c sem -n "__fish_sem_needs_command" -f -a "unsetup" -d 'Restore default `git diff` behavior'
complete -c sem -n "__fish_sem_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c sem -n "__fish_sem_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sem -n "__fish_sem_using_subcommand diff" -l commit -d 'Show changes from a specific commit' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l from -d 'Start of commit range' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l to -d 'End of commit range' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l format -d 'Output format: terminal, json, or markdown' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l file-exts -d 'Only include files with these extensions (e.g. --file-exts .py .rs)' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l color -d 'When to use colors: always, auto, never' -r -f -a "always\t''
auto\t''
never\t''"
complete -c sem -n "__fish_sem_using_subcommand diff" -s C -l cwd -d 'Run as if started in this directory (like git -C)' -r
complete -c sem -n "__fish_sem_using_subcommand diff" -l staged -d 'Show only staged changes (alias: --cached)'
complete -c sem -n "__fish_sem_using_subcommand diff" -l cached -d 'Show only staged changes (alias for --staged)'
complete -c sem -n "__fish_sem_using_subcommand diff" -l stdin -d 'Read FileChange[] JSON from stdin instead of git'
complete -c sem -n "__fish_sem_using_subcommand diff" -l patch -d 'Read unified diff from stdin (e.g. git diff | sem diff --patch)'
complete -c sem -n "__fish_sem_using_subcommand diff" -s v -l verbose -d 'Show inline content diffs for each entity'
complete -c sem -n "__fish_sem_using_subcommand diff" -l profile -d 'Show internal timing profile'
complete -c sem -n "__fish_sem_using_subcommand diff" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand impact" -l file -d 'File containing the entity (disambiguates if multiple matches)' -r
complete -c sem -n "__fish_sem_using_subcommand impact" -l file-exts -d 'Only include files with these extensions (e.g. --file-exts .py .rs)' -r
complete -c sem -n "__fish_sem_using_subcommand impact" -l deps -d 'Show direct dependencies only'
complete -c sem -n "__fish_sem_using_subcommand impact" -l dependents -d 'Show direct dependents only'
complete -c sem -n "__fish_sem_using_subcommand impact" -l tests -d 'Show affected test entities only'
complete -c sem -n "__fish_sem_using_subcommand impact" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand impact" -l no-cache -d 'Skip the SQLite entity cache (rebuild from scratch)'
complete -c sem -n "__fish_sem_using_subcommand impact" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand blame" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand blame" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand log" -l file -d 'File containing the entity (auto-detected if omitted)' -r
complete -c sem -n "__fish_sem_using_subcommand log" -l limit -d 'Maximum number of commits to scan' -r
complete -c sem -n "__fish_sem_using_subcommand log" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand log" -s v -l verbose -d 'Show content diff between versions'
complete -c sem -n "__fish_sem_using_subcommand log" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand entities" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand entities" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand context" -l file -d 'File containing the entity (disambiguates if multiple matches)' -r
complete -c sem -n "__fish_sem_using_subcommand context" -l budget -d 'Token budget' -r
complete -c sem -n "__fish_sem_using_subcommand context" -l file-exts -d 'Only include files with these extensions (e.g. --file-exts .py .rs)' -r
complete -c sem -n "__fish_sem_using_subcommand context" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand context" -l no-cache -d 'Skip the SQLite entity cache (rebuild from scratch)'
complete -c sem -n "__fish_sem_using_subcommand context" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand verify" -l file-exts -d 'Only include files with these extensions (e.g. --file-exts .py .rs)' -r
complete -c sem -n "__fish_sem_using_subcommand verify" -l json -d 'Output as JSON'
complete -c sem -n "__fish_sem_using_subcommand verify" -l diff -d 'Compare working tree vs HEAD, find broken callers from signature changes'
complete -c sem -n "__fish_sem_using_subcommand verify" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand mcp" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand setup" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand unsetup" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand completions" -s h -l help -d 'Print help'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "diff" -d 'Show semantic diff of changes (supports git diff syntax)'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "impact" -d 'Show impact of changing an entity (deps, dependents, transitive impact, tests)'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "blame" -d 'Show semantic blame — who last modified each entity'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "log" -d 'Show evolution of an entity through git history'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "entities" -d 'List entities in a file'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "context" -d 'Show token-budgeted context for an entity'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "verify" -d 'Verify function call arity across the codebase'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "mcp" -d 'Start the MCP server (stdin/stdout transport)'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "setup" -d 'Replace `git diff` with `sem diff` globally'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "unsetup" -d 'Restore default `git diff` behavior'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "completions" -d 'Generate shell completions'
complete -c sem -n "__fish_sem_using_subcommand help; and not __fish_seen_subcommand_from diff impact blame log entities context verify mcp setup unsetup completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
