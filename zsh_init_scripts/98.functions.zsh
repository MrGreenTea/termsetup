function notebook {
    local venv_name=testing
    local activated_venv=0
    if [[ $VIRTUAL_ENV != $WORKON_HOME/$venv_name ]]; then
        activated_venv=1
        workon $venv_name
    fi
    jupyter notebook
    if [[ $activated_venv -eq 1 ]]; then
        deactivate
    fi
}

function pyc {
    local code
    local modules
    if [[ $1 == "-c" ]]; then
        code=$2
        modules=$3
    else
        code="from functools import partial; print=partial(print, sep='\n'); print($1)"
        modules=$2
    fi

    if [[ -n $modules ]]; then
        modules=$(python3 -c "print(*('from {} import *;'.format(m.strip()) for m in '$modules'.split(',')), end='')")
    fi

    /usr/bin/env python3.5 -c "$modules""from sys import *; $code"
}

function gco {
    git status 1>/dev/null && git branch -a | cut -c 3- | sed 's|remotes/.*/||g' | pyc '*OrderedDict.fromkeys(stdin).keys(), sep="", end=""' collections | fzy --query=$1 | xargs git checkout
}
