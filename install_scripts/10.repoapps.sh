# add repos
repos=(ppa:philip.scott/elementary-tweaks)
for repo in $repos; do
    sudo add-apt-repository "$repo"
done

sudo apt update

# install
install_apps=(elementary-tweaks direnv httpie)

sudo apt install $install_apps

unset repo repos install_apps
