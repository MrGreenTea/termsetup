function notebook {
    local venv_name=testing
    local activated_venv=0
    if [[ $VIRTUAL_ENV != $WORKON_HOME/$venv_name ]]
    then
        activated_venv=1
        workon $venv_name
    fi
    jupyter notebook
    if [[ $activated_venv -eq 1 ]]
    then
        deactivate
    fi
}

_origpython=$(which python)

function python {
    if [[ $# -eq 0 ]]
    then
        local venv_name=testing
        local activated_venv=0
        if [[ $VIRTUAL_ENV != $WORKON_HOME/$venv_name ]]
        then
            echo "activated $venv_name environment"
            activated_venv=1
            workon $venv_name
        fi

        ipython

        if [[ $activated_venv -eq 1 ]]
        then
            echo "deactivated $venv_name environment"
            deactivate
        fi    
    else
        $_origpython "$@"
    fi
}

