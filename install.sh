#!/bin/bash

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for install_script in $DIR/install_scripts/*; do
    sh $install_script || echo "$install_script didn't work"
done

unset DIR
