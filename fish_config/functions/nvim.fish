function nvim --wraps nvim;
  if is_toolbox;
    command nvim $argv;
  else
    toolbox run nvim $argv;
  end
end
