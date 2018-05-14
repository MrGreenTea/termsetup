function notebook {
    local venv_name=testing
    local activated_venv=0
    if [[ $VIRTUAL_ENV != $WORKON_HOME/$venv_name ]]; then
        activated_venv=1
        pyenv activate $venv_name
    fi
    jupyter notebook
    if [[ $activated_venv -eq 1 ]]; then
        pyenv deactivate
    fi
}

function ipy {
    local venv_name=testing
    local activated_venv=0
    if [[ $VIRTUAL_ENV != $WORKON_HOME/$venv_name ]]; then
        echo "Activating $venv_name as virtualenv"
        activated_venv=1
        pyenv activate $venv_name
    fi
    ipython
    if [[ $activated_venv -eq 1 ]]; then
        pyenv deactivate
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

alias gco 1>/dev/null && unalias gco #if gco is aliased, the function will not be called
function gco {
    git status 1>/dev/null    
    if [[ $? != 0 ]]; then
        return $?
    fi

    local allb
    allb=$(git branch -a | cut -c 3- | sed 's|remotes/.*/||g')

    local recb
    recb=$(git reflog --pretty='%gs' | grep "checkout:" | cut --fields=6 --delimiter=' ' | pyc -c  'print(*OrderedDict.fromkeys(stdin).keys(), sep="", end="")' collections)

    allb=$(comm -2 <(echo $allb | sort ) <(echo $recb | sort) | sed "s/^[ \t]*//" | uniq)
    recb=$({ echo "$recb"; echo "$allb"; } | pyc -c  'stdin=list(stdin);print(*[k for k in OrderedDict.fromkeys(stdin).keys() if stdin.count(k) > 1], sep="", end="")' collections)

    local branches
    branches=$({ echo "$recb"; echo "$allb"; } | pyc -c  'print(*OrderedDict.fromkeys(stdin).keys(), sep="", end="")' collections | grep -vE 'develop|master|release|'$(git rev-parse --abbrev-ref HEAD) )
    if [[ -z $branches ]]; then
        echo 'no branches' >&2
        return 1
    fi

    local matches
    matches=$(echo $branches | fzy --show-matches=$1)
    if [[ -z $matches ]]; then
        echo 'no branches found for "'$1'"' >&2
        return 1
    elif [[ $(echo $matches | wc -l) -eq 1 ]]; then
        git checkout $matches
    else
        echo $branches | fzy --query=$1 | xargs -r git checkout
    fi
}
