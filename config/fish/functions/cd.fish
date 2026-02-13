function cd
    # Call the built-in cd command with all arguments
    builtin cd $argv

    # Check if .venv directory exists
    if test -d .venv
        # Print a colored message
        echo -n ".venv found, activate with: "
        set_color green
        echo "source .venv/bin/activate.fish"
        set_color normal
    end
end
