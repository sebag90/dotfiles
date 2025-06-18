{ pkgs,... }:

{
  home = {
    username = "seba";
    homeDirectory = "/home/seba";
    stateVersion = "25.05";
  };

  imports = [
    ../config_files.nix
    ./home-packages.nix
    ../common_packages.nix
    ../../modules
  ];

  home.sessionVariables = {
    NIX_BUILD_EXEC = "nixos-rebuild";
  };
}
