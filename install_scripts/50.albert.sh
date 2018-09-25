release=$(lsb_release -cs)
case "$release" in
"loki")
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list";;
"juno")
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_18.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list";;
*)
    echo "Installing albert only works for loki" && exit 1;;
esac

curl -L "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
sudo apt update
sudo apt install albert
