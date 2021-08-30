# Defined in - @ line 1
function copy --wraps='xclip -selection clipboard' --description 'copy to clipboard'
  xclip -selection clipboard $argv;
end
