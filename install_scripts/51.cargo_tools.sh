#!/bin/bash
export PATH="$HOME/.cargo/bin":$PATH
# have to install cmake for cc linker
sudo dnf groupinstall "Development Tools"
cargo install cargo-binstall

install_apps="bat exa zoxide bandwhich ytop fd-find du-dust starship procs sd git-delta git-absorb rtx-cli ripgrep atuin bottom hyperfine nu broot tokei jj-cli"
cargo binstall $install_apps

# Create jj config directory and symlink
mkdir -p ~/.config/jj
ln -sf "$(pwd)/configs/jj/config.toml" ~/.config/jj/config.toml
