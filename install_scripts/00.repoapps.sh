# add repos

repos=(ppa:fish-shell/release-3)

if [ ${#repos[@]} -gt 0 ]; then
    sudo apt install software-properties-common
    for repo in $repos; do
        sudo add-apt-repository "$repo"
    done
fi


sudo apt update

# install
install_apps=(direnv xclip)

sudo apt install $install_apps

unset repo repos install_apps
