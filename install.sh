#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

ZSH_CUSTOM="$ZSH"/custom
ZSH_PLUGINS="$ZSH_CUSTOM"/plugins

echo "installing plugins"
git clone https://github.com/horosgrisa/autoenv.git "$ZSH_PLUGINS"
git clone https://github.com/b4b4r07/enhancd.git "$ZSH_PLUGINS"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_PLGUINS"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS"

echo "installing init scripts"
cp --symbolic-link "$DIR"/zsh_init_scripts/* $ZSH/custom
cp -fi "$DIR"/.zshrc ~/.zshrc
