{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # utils
    wget
    curl
    git
    bat
    eza
    glow
    btop
    glow

    # programming
    helix
    rio
    vscodium
    just
    uv
    zellij
    pre-commit
    ruff
    python313
    python313Packages.pip
    python313Packages.ipython
    python313Packages.python-lsp-server
    python313Packages.jedi-language-server

    # containers
    podman
    podman-tui
    dive
    devcontainer
    dockerfile-language-server-nodejs
  ];
}
