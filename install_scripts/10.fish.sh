sudo apt install fish
fish_binary=$(cat /etc/shells | grep fish)
chsh --shell $fish_binary
