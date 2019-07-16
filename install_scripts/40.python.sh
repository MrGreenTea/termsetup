sudo apt install python3-dev python3-pip python3-wheel
sudo apt install libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev
sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
git clone https://github.com/momo-lab/xxenv-latest.git "$(pyenv root)"/plugins/xxenv-latest
pyenv latest install
pyenv latest global
