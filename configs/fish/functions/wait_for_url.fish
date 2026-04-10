function wait_for_url --description "Monitors a URL until it becomes reachable" --argument-names url interval

    # 1. Check if the mandatory 'url' argument was provided.
    if test -z "$url"
        echo "Usage: wait_for_url <URL> [interval_seconds]" >&2
        return 1
    end

    # 2. Set the interval to a default of 5 seconds if it wasn't provided.
    set interval (or $interval 5)

    # Use a cleaner, single-line status update.
    echo -n "👀 Monitoring $url..."

    while not curl --silent --location --head --fail --connect-timeout 5 "$url" >/dev/null
        sleep $interval
        echo -n "."
    end

    # Overwrite the monitoring line with the final success message.
    # The trailing spaces clear any leftover dots.
    echo -e "\r✅ Success! $url is now reachable.                "
end
