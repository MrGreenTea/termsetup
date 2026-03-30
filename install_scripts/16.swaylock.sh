#!/bin/bash
# ABOUTME: Installs swaylock config with blurred wallpaper

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

mkdir -p ~/.config/swaylock

# Symlink swaylock config
ln -sf "$REPO_DIR/configs/swaylock/config" ~/.config/swaylock/config

# Generate blurred wallpaper from niri wallpaper
regenerate_lock_background

regenerate_lock_background() {
  if [[ -f ~/.config/niri/wallpaper.png ]]; then
    magick ~/.config/niri/wallpaper.png \
      -blur 0x8 \
      -brightness-contrast -30x0 \
      ~/.config/swaylock/lock-background.png
    echo "Generated blurred lock screen background"
  fi
}

echo "Swaylock configured"
