curl https://sh.rustup.rs -sSf | sh
# on Fedora Silverblue we want to install the rust toolchain in a toolbox
# but fish does not seem to exist there when installed with rpm-ostree
fish --command "fish_add_path $HOME/.cargo/bin --prepend"
