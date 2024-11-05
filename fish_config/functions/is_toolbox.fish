function is_toolbox;
    if test  -f "/run/.toolboxenv";
        set TOOLBOX_NAME (cat /run/.containerenv | grep -oP "(?<=name=\")[^\";]+");
        echo "$HOSTNAME $TOOLBOX_NAME";
    else
        return 1;
    end
end
