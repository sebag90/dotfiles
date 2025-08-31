# common packages installed in all systems (except for generic)
{ pkgs, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # utils
    glow
    btop
    imagemagick

    # programming
    meld
    nodejs

    # editors
    vscodium

    # containers
    # podman
    # podman-tui
    dive
    devcontainer
  ];
}
