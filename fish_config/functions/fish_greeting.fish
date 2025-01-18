function fish_greeting
  string join " " "I'm sorry, but" (shuf -n 1 ~/.config/fish/functions/excuses.txt | sed -e 's/^./\L&\E/')
end
