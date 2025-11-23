function build
    # macOS: increase open file limit
    if test "$NIX_HOSTNAME" = "mac"
        ulimit -n 4096
    end

    # generic host: run nix
    if test "$NIX_HOSTNAME" = "generic"
        nix run $DOTFILES_DIR/nix#homeConfigurations.generic.activationPackage
    else
        # other hosts: run nix build with sudo
        sudo $NIX_BUILD_EXEC switch --impure --flake $DOTFILES_DIR/nix#$NIX_HOSTNAME
    end
end
