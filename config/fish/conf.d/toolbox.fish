if set -q TOOLBOX_PATH
    if not test -e $HOME/.config/yazi/plugins
        ln -s /nix/config/yazi/plugins $HOME/.config/yazi/plugins
    end
end
