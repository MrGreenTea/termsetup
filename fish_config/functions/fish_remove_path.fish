function fish_remove_path --argument-names path --description "Tries to remove from fish_user_paths"
    if set -l index (contains -i $path $fish_user_paths)
        set --erase --universal fish_user_paths[$index]
        echo "Updated fish_user_paths: $fish_user_paths"
    else
        echo "$path not found in fish_user_paths: $fish_user_paths"
    end
end
