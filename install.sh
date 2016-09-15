#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ZSH_CUSTOM=~/.oh-my-zsh/custom
ZSH_PLUGINS="$ZSH_CUSTOM"/plugins

echo "installing plugins"
cd "$ZSH_PLUGINS"

git clone https://github.com/horosgrisa/autoenv.git
git clone https://github.com/b4b4r07/enhancd.git
git clone https://github.com/zsh-users/zsh-autosuggestions.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

cd "$DIR"

echo "installing init scripts"
cp --symbolic-link "$DIR"/zsh_init_scripts/* $ZSH_CUSTOM
cp -fi "$DIR"/.zshrc ~/.zshrc
