function devc
    set -l toolbox_path (command -v toolbox)

    if test -n "$toolbox_path" -a -x "$toolbox_path"
        set -x SHELL /nix/profile/bin/fish
        toolbox enter devbox
    else
        echo "Toolbox is not available"
        return 1
    end
end
