function fancy_box --description "Display text inside a simple box" --argument-names text
    set --local lines (string split \n -- "$text")

    # Find the length of the longest line
    set --local max_length 0
    for line in $lines
        set --local current_length (string length -- "$line")
        if test $current_length -gt $max_length
            set max_length $current_length
        end
    end

    # 2 spaces for padding
    set --local content_width (math $max_length + 4) 

    # Example: ┌───────────┐
    set --local top_border "┌"(string repeat -n $content_width '─')"┐"
    set --local empty_line "│"(string repeat -n $content_width ' ')"│"

    # Example: └───────────┘
    set --local bottom_border "└"(string repeat -n $content_width '─')"┘"

    echo  # just some distance to the top of the terminal
    set_color brred; echo -s " $top_border"; set_color normal;
    set_color brred; echo -s " $empty_line "; set_color normal;
    for line in $lines
        set --local padded_line (string pad --right --width $max_length -- "$line");
        set_color brred; echo -ns " │"; set_color normal; set_color --bold; echo -n -s "  $padded_line  "; set_color normal; set_color brred; echo -s "│";
    end
    set_color brred; echo -s " $empty_line "; set_color normal;
    set_color brred; echo -s " $bottom_border"; set_color normal;

    return 0
end
