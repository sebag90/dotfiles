{ pkgs,... }:

{
  home = {
    username = "seba";
    homeDirectory = "/home/seba";
    stateVersion = "25.05";
  };

  imports = [
    ../common/dotfiles.nix
    ../common/packages.nix
    ../common/modules
    ./home-packages.nix
  ];

  home.sessionVariables = {
    NIX_BUILD_EXEC = "nixos-rebuild";
  };
}
