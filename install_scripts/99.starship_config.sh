#!/bin/bash
# ABOUTME: Installs starship-jj and symlinks Starship configuration files to their expected locations
# ABOUTME: Creates starship.toml and starship-jj.toml symlinks in ~/.config

# Ensure cargo bin is in PATH
export PATH="$HOME/.cargo/bin":$PATH

# Install starship-jj
cargo binstall starship-jj

# Create starship-jj config directory
mkdir -p "$HOME/.config/starship-jj"

# Symlink main Starship configuration
ln -s "$DIR/configs/starship/starship.toml" "$HOME/.config/starship.toml"

# Symlink starship-jj configuration
ln -s "$DIR/configs/starship/starship-jj.toml" "$HOME/.config/starship-jj/starship-jj.toml"