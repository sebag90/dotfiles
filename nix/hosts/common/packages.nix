{ pkgs, ghostty, ... }:
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
    rio
    lazygit
    just
    uv
    cookiecutter
    zellij
    broot
    yazi
    yaziPlugins.git
    pre-commit
    ruff
    pipx
    python313
    python313Packages.pip
    python313Packages.ipython

    # editors
    vscodium
    helix
    python313Packages.python-lsp-server
    python313Packages.jedi-language-server
    dockerfile-language-server-nodejs

    # containers
    podman
    podman-tui
    dive
    devcontainer
  ];
}
