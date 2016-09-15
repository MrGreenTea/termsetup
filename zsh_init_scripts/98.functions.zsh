venv_name=testing
function notebook {
    if [[ $VIRTUAL_ENV != $WORKON_HOME"/testing" ]]
    then
        activated_venv = 1
        workon testing
    else
        activated_venv = 0
    fi
    jupyter notebook
    if [[ $activated_venv -eq 1 ]]
    then
        deactivate
    fi
}
