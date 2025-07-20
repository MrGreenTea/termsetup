# ABOUTME: Fuzzy search directories in current tree with fd+fzf and cd to selection
# ABOUTME: Usage: cdf to interactively select and navigate to any subdirectory

function cdf --description "Fuzzy find and cd to directory"
    set -l selected_dir (fd --type d | fzf --ansi \
        --border=rounded \
        --border-label '📁 directories' \
        --height=80% \
        --layout=reverse \
        --tiebreak begin \
        --preview-window down,border-top,40% \
        --color hl:underline,hl+:underline \
        --no-hscroll \
        --cycle \
        --scroll-off=3 \
        --track \
        --scheme=path \
        -i \
        --scrollbar \
        --pointer='▶' \
        --marker='✓' \
        --separator='─' \
        --exit-0 \
        --preview 'eza -la {}' \
        --bind 'ctrl-/:change-preview-window(down,70%|hidden|)' \
        --bind "alt-h:transform:[[ \$FZF_PROMPT =~ hidden ]] && echo 'change-prompt(📁 directories> )+reload:fd --type d' || echo 'change-prompt(📁 directories (hidden)> )+reload:fd --type d --hidden --exclude .git'" \
        --bind 'ctrl-r:reload:fd --type d')
    
    if test -n "$selected_dir"
        if test -d "$selected_dir"
            cd "$selected_dir"
            echo "Changed to: $PWD"
        else
            echo "Error: Directory '$selected_dir' not found" >&2
            return 1
        end
    end
end