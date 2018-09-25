export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python3 - --src 'git+https://github.com/mitsuhiko/pipsi.git#egg=pipsi'

pipsi install poetry
pipsi install Pygments
pipsi install pre-commit
