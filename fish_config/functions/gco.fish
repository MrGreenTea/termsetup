# Defined in - @ line 1
function gco --wraps='git checkout' --description 'use fzf for quick git checkouts'
  git switch (git branch --all | fzf | tr -d '[:space:]')
end
