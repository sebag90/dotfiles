# common packages installed in all systems (except for generic)
{ pkgs, ghostty, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # utils
    glow
    btop
    imagemagick
    ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default

    # programming
    meld
    nodejs
    go

    # editors
    vscodium

    # containers
    # podman
    # podman-tui
    dive
    devcontainer
  ];
}
