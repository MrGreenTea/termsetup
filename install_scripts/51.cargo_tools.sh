#!/bin/bash
export PATH="$HOME/.cargo/bin":$PATH
# have to install cmake for cc linker
sudo dnf groupinstall "Development Tools"
cargo install cargo-binstall

install_apps="bat exa zoxide bandwhich ytop fd-find du-dust starship procs sd git-delta git-absorb rtx-cli ripgrep atuin bottom hyperfine nu broot tokei jj-cli"
cargo binstall $install_apps
