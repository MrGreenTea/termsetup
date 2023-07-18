# proudly copied from https://github.com/junegunn/fzf-git.sh/blob/main/fzf-git.sh
function fzf_branches --wraps='git branch' --description 'search git branches with fzf' -a "branch" 
  __git_branches | fzf --ansi \
      --border-label '🌲 Branches' \
      --header-lines 1 \
      --tiebreak begin \
      --preview-window down,border-top,40% \
      --color hl:underline,hl+:underline \
      --no-hscroll \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(echo {} | sed s/^..// | cut -d" " -f1)' \
      --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
      --bind "alt-a:change-prompt(🌳 All branches> )+reload:fish --command='__git_branches -a'"  \
      --query "$branch" \
      --select-1 | # quick-circuit if only one option 
  sed 's/^..//' | 
  cut -d' ' -f1
end

function gco --wraps='git checkout' --description 'use fzf for quick git checkouts' -a "branch"
  set branch (fzf_branches $branch)
  if test -z $branch
    return
  end
  set branch (python3 -c "print('$branch'.removeprefix('origin/'))")
  git switch $branch
end
