# Safe GitHub CLI Commands

This document lists GitHub CLI commands that are read-only and safe to use without making any modifications to repositories, issues, or other GitHub resources.

## Authentication & Configuration
- `gh auth status` - Check authentication status
- `gh config list` - View configuration settings

## Repository Operations
- `gh repo list` - List repositories
- `gh repo view [repo]` - View repository details
- `gh browse` - Open repository in browser

## Issues & Pull Requests
- `gh issue list` - List issues
- `gh issue view [number]` - View specific issue
- `gh pr list` - List pull requests
- `gh pr view [number]` - View specific pull request

## Workflows & Runs
- `gh workflow list` - List workflows
- `gh workflow view [workflow]` - View workflow details
- `gh run list` - List workflow runs
- `gh run view [run-id]` - View specific run

## Releases & Labels
- `gh release list` - List releases
- `gh release view [tag]` - View specific release
- `gh label list` - List repository labels

## Search Operations
- `gh search repos [query]` - Search repositories
- `gh search issues [query]` - Search issues
- `gh search prs [query]` - Search pull requests
- `gh search code [query]` - Search code
- `gh search commits [query]` - Search commits

## Secrets & Variables (View Only)
- `gh secret list` - List secrets (names only)
- `gh variable list` - List variables

## Other Safe Commands
- `gh gist list` - List your gists
- `gh ssh-key list` - List SSH keys
- `gh gpg-key list` - List GPG keys
- `gh extension list` - List installed extensions
- `gh codespace list` - List codespaces
- `gh codespace view [name]` - View codespace details
- `gh cache list` - List repository caches
- `gh org list` - List organizations
- `gh project list` - List projects
- `gh project view [number]` - View project details
- `gh ruleset list` - List rulesets
- `gh ruleset view [id]` - View ruleset details

## Important Notes

- All commands listed above only read and display information
- These commands will not modify repositories, create issues, or change any GitHub resources
- When in doubt, any command with `list` or `view` is typically safe
- Avoid commands with `create`, `edit`, `delete`, `close`, or `merge` unless you intend to make changes