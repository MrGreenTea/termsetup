sudo rpm-ostree install fish
# also install in toolbox
toolbox run sudo dnf install fish
fish_binary=$(grep fish /etc/shells)
sudo lchsh --shell $fish_binary
