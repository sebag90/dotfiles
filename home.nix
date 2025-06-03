{ config, pkgs, ... }:

{

  home.username = "seba";
  home.homeDirectory = "/home/seba";

  home.file.".zshrc".source = "/home/seba/dotfiles/zshrc";
  home.file.".my_functions".source = "/home/seba/dotfiles/my_functions";
  home.file.".config/rio/config.toml".source = "/home/seba/dotfiles/rio/config.toml";  
  home.file.".config/rio/themes/rose-pine.toml".source = "/home/seba/dotfiles/rio/rose-pine.toml";
  home.file.".oh-my-zsh/themes/mytheme.zsh-theme".source = "/home/seba/dotfiles/mytheme.zsh-theme";
    
  home.stateVersion = "25.05";
}
