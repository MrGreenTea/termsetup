# run nvim inside toolbox if not already inside a toolbox
if status is-interactive
  set -gx EDITOR nvim
end

function nvim --wraps nvim;
  if is_toolbox;
    command nvim $argv;
  else
    toolbox run nvim $argv;
  end
end
