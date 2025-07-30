# ABOUTME: Core helper functions for jj completion system
# ABOUTME: Auto-generated from jj util completion fish

# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_jj_global_optspecs
	string join \n R/repository= ignore-working-copy ignore-immutable at-operation= debug color= quiet no-pager config= config-toml= config-file= h/help V/version
end

function __fish_jj_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_jj_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_jj_using_subcommand
	set -l cmd (__fish_jj_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

function __fish_jj_complete_revisions
	# Generate revision IDs for completion
	jj log --no-graph --limit 50 -T 'change_id.shortest() ++ "\t" ++ if(description, description.first_line(), "(no description)") ++ "\n"' 2>/dev/null
	# Also include bookmarks
	jj bookmark list -T 'name ++ "\t[bookmark]\n"' 2>/dev/null
end

function __fish_jj_complete_bookmark_names
	# Generate bookmark names for completion
	jj bookmark list -T 'name ++ "\n"' 2>/dev/null
end

