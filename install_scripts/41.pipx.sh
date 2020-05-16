export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

python3 -m pip install --user pipx && python3 -m pipx ensurepath

mkdir "$ZSH_CUSTOM/plugins/pipx/"
echo 'eval "$(register-python-argcomplete pipx)"' > "$ZSH_CUSTOM/plugins/pipx/pipx.plugin.zsh"

pipx install poetry
pipx install pre-commit
