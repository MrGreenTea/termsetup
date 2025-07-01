# proudly copied from https://github.com/junegunn/fzf-git.sh/blob/main/fzf-git.sh
function _fzf_selected_branches --wraps='git branch' --description 'search git branches with fzf' -a "branch"
  test -n "$branch" && set -l select1 "--select-1"  # quick-circuit if only one matching branch, if initial branch is given
  __git_branches | fzf --ansi \
      --border=rounded \
      --border-label '🌲 selected_branches' \
      --header-lines 1 \
      --header-first \
      --height=80% \
      --layout=reverse \
      --tiebreak begin \
      --preview-window down,border-top,40% \
      --color hl:underline,hl+:underline \
      --no-hscroll \
      --cycle \
      --scroll-off=3 \
      --track \
      --scheme=path \
      -i \
      --scrollbar \
      --pointer='▶' \
      --marker='✓' \
      --separator='─' \
      --exit-0 \
      --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(echo {} | sed s/^..// | cut -d" " -f1) | head -20' \
      --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
      --bind "alt-a:change-prompt(🌳 All selected_branches> )+reload:fish --command='__git_branches -a'"  \
      --bind 'ctrl-r:reload:fish --command="__git_branches"' \
      --bind 'ctrl-d:preview:git diff HEAD..$(echo {} | sed s/^..// | cut -d" " -f1)' \
      --bind 'ctrl-l:preview:git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(echo {} | sed s/^..// | cut -d" " -f1)' \
      --bind 'alt-enter:execute:echo "🌿 Creating new branch from: {}" > /dev/tty' \
      --query "$selected_branch" \
      $select1 |
  sed 's/^..//' |
  cut -d' ' -f1
end

function gco --wraps='git checkout' --description 'use fzf for quick git checkouts' -a "branch"
  set -l selected_branch (_fzf_selected_branches $branch)
  if test -z "$selected_branch"
    return 1
  end
  
  # Remove origin/ prefix more safely
  if string match -q 'origin/*' "$selected_branch"
    set selected_branch (string replace 'origin/' '' "$selected_branch")
  end
  
  # Validate branch name and switch
  if test -n "$selected_branch"
    if git show-ref --verify --quiet "refs/heads/$selected_branch" 2>/dev/null
      git switch "$selected_branch"
    else if git show-ref --verify --quiet "refs/remotes/origin/$selected_branch" 2>/dev/null
      git switch -c "$selected_branch" "origin/$selected_branch"
    else
      echo "Error: Branch '$selected_branch' not found" >&2
      return 1
    end
  else
    echo "Error: Invalid branch selection" >&2
    return 1
  end
end
