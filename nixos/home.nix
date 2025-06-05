{ config, pkgs, dotfiles,... }:

{
  # TODO please change the username & home directory to your own
  home.username = "seba";
  home.homeDirectory = "/home/seba";

  # home.file.".zshrc".source = "/home/seba/dotfiles/zshrc";
  #home.file.".my_functions".source = "./dotfiles/my_functions";
  #home.file.".config/rio/config.toml".source = "./dotfiles/rio/config.toml";  
  #home.file.".config/rio/themes/rose-pine.toml".source = "./dotfiles/rio/rose-pine.toml";
  home.file.".oh-my-zsh/themes/mytheme.zsh-theme".source = dotfiles.zshtheme;
  home.file.".oh-my-zsh/custom/themes/mytheme.zsh-theme".source = dotfiles.zshtheme;

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    firefox
    wget
    curl
    git
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
    glow # markdown previewer in terminal
    btop  # replacement of htop/nmon
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userEmail = "email@giglis.eu";
  };

  programs.zsh = {
    enable = true;
    # enableCompletions = true;
    # autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    sessionVariables = {
      ZSH_CUSTOM = "/home/seba/.oh-my-zsh/custom";
      EDITOR = "micro";
    };
    oh-my-zsh = { # "ohMyZsh" without Home Manager
      enable = true;
      theme = "mytheme";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
