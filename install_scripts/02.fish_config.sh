fish_config=$HOME/.config/fish;
if [ -e "$fish_config" ]; then rm -r "$fish_config"; fi
ln -s "$DIR"/fish_config "$fish_config"
