function bgnotify_formatted {
        elapsed="$(( $3 % 60 ))s"
        (( $3 >= 60 )) && elapsed="$((( $3 % 3600) / 60 ))m $elapsed"
        (( $3 >= 3600 )) && elapsed="$(( $3 / 3600 ))h $elapsed"
	[ $1 -eq 0 ] && prog_status=$'\u2714' || prog_status=$'\u2716'
        dbus-send \
            --type=method_call \
            --session \
            --dest=org.pantheon.terminal \
            /org/pantheon/terminal \
            org.pantheon.terminal.ProcessFinished \
            string:$PANTHEON_TERMINAL_ID \
            string:"\"$(fc -ln -1)\" $prog_status nach $elapsed"
}

# this is a workaround for a elementary hack, first message is ignored so we just send a fake one
dbus-send \
        --type=method_call \
        --session \
        --dest=org.pantheon.terminal \
        /org/pantheon/terminal \
        org.pantheon.terminal.ProcessFinished \
        string:$PANTHEON_TERMINAL_ID \
        string:"You should not have seen this, please report the incident to Pantheon Terminal developers."
