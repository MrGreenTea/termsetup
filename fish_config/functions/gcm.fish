# Defined in - @ line 1
function gcm --wraps='git checkout main' --description 'alias gcm=git checkout main'
  for branch in main master;
    if git switch $branch $argv
      return 0
    end
  end
end
