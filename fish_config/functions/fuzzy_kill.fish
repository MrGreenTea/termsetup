function fuzzy_kill --description 'Interactive process killer using fzf with beautiful interface'
    # Get user processes with formatted output
    set -l processes (ps -u $USER -o pid,user,%cpu,%mem,comm --no-headers | \
        grep -v -E '(systemd|dbus|pulseaudio)' | \
        sort -k3 -nr)
    
    if test (count $processes) -eq 0
        echo "No user processes found to kill"
        return 1
    end
    
    # Use fzf to select processes with enhanced beautiful styling
    set -l selected (printf '%s\n' $processes | \
        fzf --ansi \
            --border=rounded \
            --border-label '💀 Kill Process' \
            --header 'TAB: multi-select, ENTER: kill selected, ESC: cancel' \
            --info=inline-right \
            --separator='─' \
            --scrollbar='▍▌' \
            --pointer='▶' \
            --marker='✓' \
            --multi \
            --cycle \
            --layout=reverse \
            --height=80% \
            --tiebreak=begin,length \
            --preview-window right,50%:border-left:wrap \
            --preview-label='Process Info' \
            --preview 'echo "Process Details:" && echo "PID: {1}" && echo "User: {2}" && echo "CPU%: {3}" && echo "Memory%: {4}" && echo "Command: {5}" && echo "" && echo "Process Tree:" && pstree -p {1} 2>/dev/null || echo "No process tree available"' \
            --color 'hl:underline,hl+:underline' \
            --no-hscroll \
            --bind 'ctrl-/:change-preview-window(right,70%|hidden|)' \
            --prompt '🔍 Select processes to kill> ')
    
    if test -z "$selected"
        echo "No processes selected"
        return 0
    end
    
    # Extract PIDs and confirm
    set -l pids
    for line in $selected
        set -a pids (echo $line | awk '{print $1}')
    end
    
    echo "Selected processes to kill:"
    printf '%s\n' $selected
    echo ""
    
    # Confirmation
    read -P "Kill these process(es)? [y/N]: " -l confirm
    
    if test "$confirm" = "y" -o "$confirm" = "Y"
        for pid in $pids
            if kill $pid 2>/dev/null
                echo "✓ Killed process $pid"
            else
                echo "✗ Failed to kill process $pid (permission denied or process not found)"
            end
        end
    else
        echo "Cancelled"
    end
end
