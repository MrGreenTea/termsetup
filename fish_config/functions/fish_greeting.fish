function fish_greeting
    # Set the path to your excuses.txt file
    set excuse_file ~/.config/fish/functions/excuses.txt
    
    # Check if the excuses.txt file exists
    if test -f $excuse_file
        # Get a random line from the file using `shuf`
        set random_excuse (shuf -n 1 $excuse_file)
        
        # Display the excuse with the desired message format
        echo "I'm sorry, but $random_excuse"
    else
        # Fallback message if excuses.txt is missing
        echo "I'm sorry, but I can't think of any excuses right now."
    end
end
