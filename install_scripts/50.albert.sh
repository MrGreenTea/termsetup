lsb_release -cs | grep "loki" > /dev/null
if [ $? -ne 0 ]; then echo "Installing albert only works for loki"; exit 1; fi
curl -L "https://build.opensuse.org/projects/home:manuelschneid3r/public_key" | sudo apt-key add -
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt update
sudo apt install albert
