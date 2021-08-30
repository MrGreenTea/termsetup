# Defined in - @ line 1
function paste --wraps='xclip -selection clipboard -out' --description 'paste clipboard content to stdout'
  xclip -selection clipboard -out $argv;
end
