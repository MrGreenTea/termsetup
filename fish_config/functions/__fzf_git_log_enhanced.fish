function __fzf_git_log_enhanced --description "Search git log with preview, copy hash or checkout"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '__fzf_git_log_enhanced: Not in a git repository.' >&2
    else
        set --local --export SHELL (command --search fish)

        set selected_commit (
            git log --color=always --format=format:'%C(bold blue)%h%C(reset) - %C(cyan)%as%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)' | \
            fzf --ansi --tiebreak=index \
                --preview='git show --color=always (string split --max 1 " " {})[1]' \
                --header='Enter: copy hash | Ctrl-O: checkout | Ctrl-D: show diff' \
                --bind='ctrl-o:execute(git checkout (string split --max 1 " " {})[1])' \
                --bind='ctrl-d:execute(git show (string split --max 1 " " {})[1] | less -R)' \
                --expect='ctrl-o,ctrl-d'
        )
        
        if test $status -eq 0 -a -n "$selected_commit"
            set action (echo $selected_commit | head -1)
            set commit_line (echo $selected_commit | tail -1)
            
            if test -n "$commit_line"
                set abbreviated_commit_hash (string split --max 1 " " $commit_line)[1]
                set commit_hash (git rev-parse $abbreviated_commit_hash)
                
                switch $action
                    case ctrl-o
                        git checkout $commit_hash
                    case ctrl-d
                        git show $commit_hash | less -R
                    case ''
                        # Default action: insert commit hash
                        commandline --insert $commit_hash
                end
            end
        end
    end

    commandline --function repaint
end