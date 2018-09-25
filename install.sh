#!/bin/bash
set -e

export DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for install_script in $DIR/install_scripts/*; do
    bash -e $install_script || >&2 echo "$install_script didn't work"
done

unset DIR
