# ABOUTME: Core helper functions for gh completion system
# ABOUTME: Provides utilities for dynamic completion and repository context detection

# Check if we're in a git repository and get repo info
function __fish_gh_current_repo
    if command -v gh >/dev/null 2>&1
        gh repo view --json nameWithOwner -q '.nameWithOwner' 2>/dev/null
    end
end

# Complete pull request numbers from current repo
function __fish_gh_complete_prs
    set -l repo (__fish_gh_current_repo)
    if test -n "$repo"
        gh pr list --repo "$repo" --json number,title --limit 50 2>/dev/null | \
            jq -r '.[] | "\(.number)\t\(.title)"' 2>/dev/null
    end
end

# Complete issue numbers from current repo
function __fish_gh_complete_issues
    set -l repo (__fish_gh_current_repo)
    if test -n "$repo"
        gh issue list --repo "$repo" --json number,title --limit 50 2>/dev/null | \
            jq -r '.[] | "\(.number)\t\(.title)"' 2>/dev/null
    end
end

# Complete branch names for the current repo
function __fish_gh_complete_branches
    set -l repo (__fish_gh_current_repo)
    if test -n "$repo"
        gh api "repos/$repo/branches" --paginate --jq '.[].name' 2>/dev/null
    end
end

# Complete workflow names from current repo
function __fish_gh_complete_workflows
    set -l repo (__fish_gh_current_repo)
    if test -n "$repo"
        gh workflow list --repo "$repo" --json name,id 2>/dev/null | \
            jq -r '.[] | "\(.name)\t[\(.id)]"' 2>/dev/null
    end
end

# Complete repository names (existing function from current gh.fish)
function __fish_gh_complete_repos
    # Get user repositories
    gh repo list --json nameWithOwner,description --limit 100 2>/dev/null | \
        jq -r '.[] | .nameWithOwner + "\t" + (if .description == "" then "(no description)" else .description end)' 2>/dev/null
    
    # Get organization repositories
    for org in (gh api /user/orgs -q '.[].login' 2>/dev/null)
        gh repo list $org --json nameWithOwner,description --limit 100 2>/dev/null | \
            jq -r '.[] | .nameWithOwner + "\t" + (if .description == "" then "(no description)" else .description end)' 2>/dev/null
    end
end

# Helper to check if we need a command (similar to jj pattern)
function __fish_gh_needs_command
    set -l cmd (commandline -opc)
    set -e cmd[1]  # Remove 'gh'
    if set -q cmd[1]
        # Return the command found
        echo $cmd[1]
        return 1
    end
    return 0
end

# Helper to check if using a specific subcommand
function __fish_gh_using_subcommand
    set -l cmd (__fish_gh_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd $argv
end