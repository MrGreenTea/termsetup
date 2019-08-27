# add repos
sudo apt install software-properties-common

repos=()
for repo in $repos; do
    sudo add-apt-repository "$repo"
done

sudo apt update

# install
install_apps=(direnv)

sudo apt install $install_apps

unset repo repos install_apps
