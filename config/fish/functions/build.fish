function build
    # macOS: increase open file limit
    if test "$NIX_HOSTNAME" = mac
        ulimit -n 4096
    end

    set ARCH (uname -m)
    set OS (string lower (uname -s))
    set SYSTEM "$ARCH-$OS"

    # nix package manager
    if contains "$NIX_HOSTNAME" headless container laptop
        nix run $DOTFILES_DIR#homeConfigurations.$SYSTEM.$NIX_HOSTNAME.activationPackage
    else
        # nixos and nix darwin (mac)
        sudo $NIX_BUILD_EXEC switch --impure --flake $DOTFILES_DIR#$NIX_HOSTNAME
    end
end
