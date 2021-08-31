export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

python3 -m pip install --user pipx && python3 -m pipx ensurepath

pipx install poetry
pipx install pre-commit
