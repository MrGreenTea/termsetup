alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo utilities-terminal || echo error)" "$(fc -ln -1)"'

function bgnotify_formatted {
        elapsed="$(( $3 % 60 ))s"
        (( $3 >= 60 )) && elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
        (( $3 >= 3600 )) && elapsed="$(( $3 / 3600 ))h $elapsed"
	[ $1 -eq 0 ] && prog_status=$'\u2714' || prog_status=$'\u2716'
        alert "$prog_status after $elapsed"
}
