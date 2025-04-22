function fancy_box --description "Display text inside a simple box" --argument-names text
    set --local text_length (string length -- "$text")

    # 2 spaces for padding
    set --local content_width (math $text_length + 2)

    # Example: ┌───────────┐
    set --local top_border "┌"(string repeat -n $content_width '─')"┐"
    # Example: │ Text Here │
    set --local middle_line "│ $text │"
    # Example: └───────────┘
    set --local bottom_border "└"(string repeat -n $content_width '─')"┘"

    echo $top_border
    echo $middle_line
    echo $bottom_border

    return 0
end
