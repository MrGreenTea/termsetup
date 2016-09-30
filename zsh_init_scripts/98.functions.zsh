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

