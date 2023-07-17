# Defined in - @ line 1
function gcm --wraps='git checkout master' --description 'alias gcm=git checkout master'
  git switch master $argv;
end
