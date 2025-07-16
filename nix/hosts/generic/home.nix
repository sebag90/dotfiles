{ config, pkgs, ... }:

{
  home.username = "seba"; # or your remote user
  home.homeDirectory = "/home/seba";

  programs.zsh.enable = true;
  programs.git.enable = true;

  imports = [
    ../common/dotfiles.nix
    ../common/packages.nix
    ../common/modules
  ];

  home.stateVersion = "24.05"; # or whichever matches your setup
}
