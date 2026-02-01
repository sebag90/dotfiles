function build
    # macOS: increase open file limit
    if test "$NIX_HOSTNAME" = mac
        ulimit -n 4096
    end

    # nix package manager
    if contains "$NIX_HOSTNAME" generic laptop
        nix run $DOTFILES_DIR/nix#homeConfigurations.$NIX_HOSTNAME.activationPackage
    else
        # nixos and nix darwin (mac)
        sudo $NIX_BUILD_EXEC switch --impure --flake $DOTFILES_DIR/nix#$NIX_HOSTNAME
    end
end
