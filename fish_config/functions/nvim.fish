# run nvim inside toolbox if not already inside a toolbox

function nvim --wraps nvim;
  if is_toolbox;
    command nvim $argv;
  else
    toolbox run nvim $argv;
  end
end
