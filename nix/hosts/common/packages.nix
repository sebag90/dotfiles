{ pkgs, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # utils
    glow
    btop

    # programming
    rio
    meld

    # editors
    vscodium

    # containers
    podman
    podman-tui
    dive
    devcontainer
  ];
}
