function fish_greeting
  string join " " "I'm sorry, but" (nu -c 'open ~/.config/fish/functions/excuses.yml | shuffle | first | get text_en' | sed -e 's/^./\L&\E/')
end
