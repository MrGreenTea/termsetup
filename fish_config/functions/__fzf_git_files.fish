function __fzf_git_files --description "Fuzzy search modified files with actions (add/restore/diff)"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '__fzf_git_files: Not in a git repository.' >&2
    else
        set --local --export SHELL (command --search fish)
        
        set selected_file (
            git -c color.status=always status --short | \
            fzf --ansi \
                --preview='git diff --color=always -- (echo {} | cut -c4-)' \
                --header='Enter: stage/unstage | Ctrl-D: diff | Ctrl-R: restore' \
                --bind='ctrl-d:execute(git diff -- (echo {} | cut -c4-) | less -R)' \
                --bind='ctrl-r:execute(git restore (echo {} | cut -c4-))' \
                --expect='ctrl-d,ctrl-r'
        )
        
        if test $status -eq 0 -a -n "$selected_file"
            set action (echo $selected_file | head -1)
            set file_line (echo $selected_file | tail -1)
            
            if test -n "$file_line"
                set status_char (string sub --length 1 $file_line)
                set file_path (string sub --start=4 $file_line)
                
                switch $action
                    case ctrl-d
                        git diff -- $file_path | less -R
                    case ctrl-r
                        git restore $file_path
                    case ''
                        # Default action: toggle staging
                        if test "$status_char" = ' '
                            git add $file_path
                        else
                            git restore --staged $file_path
                        end
                end
            end
        end
    end
    
    commandline --function repaint
end