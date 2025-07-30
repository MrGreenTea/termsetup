
# Helper function to list all accessible repositories for completion
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

# Custom completion for gh repo clone
complete -c gh -n '__fish_seen_subcommand_from repo; and __fish_seen_subcommand_from clone' -f -a '(__fish_gh_complete_repos)'
