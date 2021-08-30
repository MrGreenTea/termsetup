# add repos

repos=()

if [ ${#repos[@]} -gt 0 ]; then
    sudo apt install software-properties-common
    for repo in $repos; do
        sudo add-apt-repository "$repo"
    done
fi


sudo apt update

# install
install_apps=(direnv)

sudo apt install $install_apps

unset repo repos install_apps

