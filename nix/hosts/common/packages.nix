# common packages installed in all systems (except for generic)
{ pkgs, goosebutils, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # goosebutils binaries
    goosebutils.packages.${pkgs.system}.search
    goosebutils.packages.${pkgs.system}.dstroy
    goosebutils.packages.${pkgs.system}.devenver

    # utils
    glow
    btop
    imagemagick

    # programming
    meld
    nodejs
    go

    # editors
    vscodium
    zed-editor
    flow-control

    # containers
    # podman
    # podman-tui
    dive
    devcontainer
  ];
}
