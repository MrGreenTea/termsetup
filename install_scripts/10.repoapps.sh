# add repos
repos=(ppa:ultradvorka/ppa)
for repo in $repos; do
    sudo add-apt-repository "$repo"
done

sudo apt update

# install
install_apps=(hh)

sudo apt install $install_apps

unset repo repos install_apps

