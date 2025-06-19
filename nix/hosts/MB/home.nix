{ pkgs,... }:

{
  home = {
    username = "sebastiano";
    homeDirectory = "/Users/sebastiano";
    stateVersion = "25.05";
  };

  imports = [
    ../config_files.nix
    ./home-packages.nix
    ../common_packages.nix
    ../../modules
  ];

  home.sessionVariables = {
    NIX_BUILD_EXEC = "darwin-rebuild";
  };
}
