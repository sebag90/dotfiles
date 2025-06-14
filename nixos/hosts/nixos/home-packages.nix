{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
      firefox
      wget
      curl
      git
      bat
      eza
      python313
      python313Packages.pip
      python313Packages.ipython
      just
      btop
      cargo
      gcc
      podman-tui
      dive
      docker-compose
      micro
      vscodium
      rio
      uv
      deja-dup
      soundconverter
      ffmpeg
      zellij
      solaar
      home-manager
      devcontainer
      glow  # markdown previewer in terminal
      btop  # replacement of htop/nmon
      helix
      pinta
      pre-commit
    ];
}
