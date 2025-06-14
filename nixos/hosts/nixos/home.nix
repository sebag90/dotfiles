{ pkgs, dotfiles,... }:

{
  home = {
    username = "seba";
    homeDirectory = "/home/seba";
    stateVersion = "25.05";
  };

  imports = [
    ../config_files.nix
    ./home-packages.nix
    ./modules
  ];
}
