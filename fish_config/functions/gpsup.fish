# Defined in - @ line 1
function gpsup --wraps='git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)' --description 'alias gpsup=git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)'
  git push --set-upstream origin (git rev-parse --abbrev-ref HEAD) $argv;
end
