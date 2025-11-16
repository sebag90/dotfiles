# minimal packages, installed in all system including generic
{ pkgs, helix, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # utils
    wget
    curl
    git
    bat
    eza
    unzip
    serpl

    # programming
    lazygit
    just
    uv
    cookiecutter
    zellij
    yazi
    yaziPlugins.git
    pre-commit
    ruff
    pipx
    python313
    python313Packages.pip
    python313Packages.ipython
    lazydocker

    # editors
    flow-control
    helix.packages.${pkgs.stdenv.hostPlatform.system}.default
    python313Packages.python-lsp-server
    python313Packages.jedi-language-server
    dockerfile-language-server-nodejs
    gopls
  ];
}
