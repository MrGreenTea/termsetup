export PATH="$HOME/.cargo/bin":$PATH
cargo install cargo-binstall

install_apps="bat exa zoxide bandwhich ytop fd-find du-dust starship procs sd git-delta rtx-cli"
cargo bininstall $install_apps
