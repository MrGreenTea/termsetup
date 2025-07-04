# Create WezTerm config directory and symlink all config files
mkdir -p "$HOME/.config/wezterm"

for config_file in "$DIR/configs/wezterm"/*.lua; do
  if [ -f "$config_file" ]; then
    config_name=$(basename "$config_file")
    ln -sf "$config_file" "$HOME/.config/wezterm/$config_name"
  fi
done
