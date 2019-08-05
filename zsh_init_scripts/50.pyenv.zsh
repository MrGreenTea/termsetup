export PATH="/home/$USER/.pyenv/bin:$PATH"

if [[ -z "$VIRTUAL_ENV" ]]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
