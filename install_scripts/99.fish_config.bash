#!/bin/bash
# run this last as fish commands won't work otherwise until all tools are installed
# especially rust/cargo tooling is needed
fish_config=$HOME/.config/fish
folders=(completions conf.d functions)
for dir in "${folders[@]}"; do
    fish_target_dir="$fish_config/$dir"
    source_dir="$DIR"/fish_config/"$dir"
    echo "Linking $source_dir to $fish_target_dir"
    if [ -e "$fish_target_dir" ]; then
        echo "Deleting existing $fish_target_dir"
        rm -r "$fish_target_dir"
    fi
    ln -s "$source_dir" "$fish_target_dir"
done
