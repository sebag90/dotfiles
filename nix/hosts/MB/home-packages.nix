{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    helix
    eza
    bat
    rio
    vscodium
    just
    uv
    podman
    podman-tui
    btop
    glow
    zellij
    dive
    devcontainer
    python313
    python313Packages.pip
    python313Packages.ipython
    pre-commit
    poetry
    nodejs
  ];
}
