# add repos
repos=()
for repo in $repos; do
    sudo add-apt-repository "$repo"
done

sudo apt update

# install
install_apps=()

sudo apt install $install_apps

unset repo repos install_apps

