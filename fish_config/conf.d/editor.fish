if status is-interactive && is_toolbox 
  set -gx EDITOR nvim
else
  set -gx EDITOR "toolbox run -- nvim"
end
