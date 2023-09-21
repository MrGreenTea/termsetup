# proudly copied from https://github.com/junegunn/fzf-git.sh/blob/main/fzf-git.sh
function _fzf_selected_branches --wraps='git branch' --description 'search git branches with fzf' -a "branch" 
  __git_branches | fzf --ansi \
      --border-label '🌲 selected_branches' \
      --header-lines 1 \
      --tiebreak begin \
      --preview-window down,border-top,40% \
      --color hl:underline,hl+:underline \
      --no-hscroll \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(echo {} | sed s/^..// | cut -d" " -f1)' \
      --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
      --bind "alt-a:change-prompt(🌳 All selected_branches> )+reload:fish --command='__git_branches -a'"  \
      --query "$selected_branch" \
      --select-1 | # quick-circuit if only one option 
  sed 's/^..//' | 
  cut -d' ' -f1
end

function gco --wraps='git checkout' --description 'use fzf for quick git checkouts' -a "branch"
  if test -n $branch
  end
    
  set selected_branch (_fzf_selected_branches $selected_branch)
  if test -z $selected_branch
    return
  end
  set selected_branch (python3 -c "print('$selected_branch'.removeprefix('origin/'))")
  git switch $selected_branch
end
