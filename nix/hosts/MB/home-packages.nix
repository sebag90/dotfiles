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
    python313Packages.python-lsp-server
    python313Packages.jedi-language-server
    dockerfile-language-server-nodejs
    pre-commit
    poetry
    nodejs
    ruff
  ];
}
