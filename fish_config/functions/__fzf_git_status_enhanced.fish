function __fzf_git_status_enhanced --description "Interactive git status with staging options"
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo '__fzf_git_status_enhanced: Not in a git repository.' >&2
    else
        set --local --export SHELL (command --search fish)
        
        set selected_files (
            git -c color.status=always status --short | \
            fzf --ansi --multi \
                --preview='git diff --color=always -- (echo {} | cut -c4-)' \
                --header='Tab: select multiple | Enter: stage/unstage | Ctrl-A: add all | Ctrl-R: restore | Ctrl-D: diff' \
                --bind='ctrl-a:execute(git add -A)' \
                --bind='ctrl-r:execute(git restore (echo {} | cut -c4-))' \
                --bind='ctrl-d:execute(git diff -- (echo {} | cut -c4-) | less -R)' \
                --expect='ctrl-a,ctrl-r,ctrl-d'
        )
        
        if test $status -eq 0 -a -n "$selected_files"
            set action (echo $selected_files | head -1)
            set file_lines (echo $selected_files | tail -n +2)
            
            switch $action
                case ctrl-a
                    git add -A
                case ctrl-r
                    for file_line in $file_lines
                        if test -n "$file_line"
                            set file_path (string sub --start=4 $file_line)
                            git restore $file_path
                        end
                    end
                case ctrl-d
                    for file_line in $file_lines
                        if test -n "$file_line"
                            set file_path (string sub --start=4 $file_line)
                            git diff -- $file_path | less -R
                        end
                    end
                case ''
                    # Default action: toggle staging for selected files
                    for file_line in $file_lines
                        if test -n "$file_line"
                            set status_char (string sub --length 1 $file_line)
                            set file_path (string sub --start=4 $file_line)
                            
                            if test "$status_char" = ' '
                                git add $file_path
                            else
                                git restore --staged $file_path
                            end
                        end
                    end
            end
        end
    end
    
    commandline --function repaint
end