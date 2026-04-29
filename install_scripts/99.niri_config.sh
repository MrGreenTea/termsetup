#!/bin/bash
# ABOUTME: Creates niri config directories and symlinks configuration files

# Derive DIR from script location if not already set
DIR="${DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"

# Create niri config directory
mkdir -p "$HOME/.config/niri"

# Symlink niri config
ln -sf "$DIR/configs/niri/config.kdl" "$HOME/.config/niri/config.kdl"
ln -sf "$DIR/configs/niri/window-switcher.py" "$HOME/.config/niri/window-switcher.py"

# Create waybar config directory and symlinks
mkdir -p "$HOME/.config/waybar"

ln -sf "$DIR/configs/waybar/config" "$HOME/.config/waybar/config"
ln -sf "$DIR/configs/waybar/style.css" "$HOME/.config/waybar/style.css"

# Create fuzzel config directory and symlink
mkdir -p "$HOME/.config/fuzzel"

ln -sf "$DIR/configs/fuzzel/config" "$HOME/.config/fuzzel/config"

# Create mako config directory and symlink
mkdir -p "$HOME/.config/mako"
ln -sf "$DIR/configs/mako/config" "$HOME/.config/mako/config"

# Create swayidle config directory and symlink
mkdir -p "$HOME/.config/swayidle"
ln -sf "$DIR/configs/swayidle/config" "$HOME/.config/swayidle/config"

# Create swaylock config directory and symlink
mkdir -p "$HOME/.config/swaylock"
ln -sf "$DIR/configs/swaylock/config" "$HOME/.config/swaylock/config"

# Create directory for wallpaper (user should add their own wallpaper)
mkdir -p "$HOME/.config/niri"

echo "Niri configuration symlinks created."
echo "Note: Add a wallpaper image to ~/.config/niri/wallpaper.png or modify config.kdl"