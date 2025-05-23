#!/bin/bash
set -oe nounset

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for install_script in $DIR/install_scripts/*; do
    echo Running $install_script;
    bash -ue $install_script;
done

unset DIR
