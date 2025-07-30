# ABOUTME: Base Cobra completion integration for gh commands
# ABOUTME: Provides fallback dynamic completion using gh's built-in completion system

# Core completion function that calls gh's built-in completion
function __fish_gh_perform_completion
    # Extract all args except the last one
    set -l args (commandline -opc)
    # Extract the last arg and escape it in case it is a space
    set -l lastArg (string escape -- (commandline -ct))

    # Disable ActiveHelp which is not supported for fish shell
    set -l requestComp "GH_ACTIVE_HELP=0 $args[1] __complete $args[2..-1] $lastArg"

    set -l results (eval $requestComp 2>/dev/null)

    # Some programs may output extra empty lines after the directive.
    # Let's ignore them or else it will break completion.
    for line in $results[-1..1]
        if test (string trim -- $line) = ""
            # Found an empty line, remove it
            set results $results[1..-2]
        else
            # Found non-empty line, we have our proper output
            break
        end
    end

    set -l comps $results[1..-2]
    set -l directiveLine $results[-1]

    # For Fish, when completing a flag with an = (e.g., <program> -n=<TAB>)
    # completions must be prefixed with the flag
    set -l flagPrefix (string match -r -- '-.*=' "$lastArg")

    for comp in $comps
        printf "%s%s\n" "$flagPrefix" "$comp"
    end

    printf "%s\n" "$directiveLine"
end

# Cache results to avoid repeated calls
function __fish_gh_perform_completion_once
    if test -n "$__gh_perform_completion_once_result"
        return 0
    end

    set --global __gh_perform_completion_once_result (__fish_gh_perform_completion)
    if test -z "$__gh_perform_completion_once_result"
        return 1
    end

    return 0
end

# Clear the completion cache
function __fish_gh_clear_perform_completion_once_result
    set --erase __gh_perform_completion_once_result
end

# Main completion function that integrates with fish
function __fish_gh_complete_command
    __fish_gh_perform_completion_once
    if test -z "$__gh_perform_completion_once_result"
        return 1
    end

    set -l comps $__gh_perform_completion_once_result[1..-2]
    set -l directiveLine $__gh_perform_completion_once_result[-1]

    for comp in $comps
        echo $comp
    end
end

# Register the base completion - this provides comprehensive completion for all gh commands
# Custom completions supplement this with enhanced argument completions
complete -c gh -f -a '(__fish_gh_complete_command)'