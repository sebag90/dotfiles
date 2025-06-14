{ config, hostname, ... }:

let
  secretsPath = "${config.home.homeDirectory}/code/dotfiles/nixos/hosts/${hostname}/secrets.nix";
  secrets = if builtins.pathExists secretsPath then import secretsPath else {};
in {
  programs.git = {
    enable = true;
    userEmail = secrets.userEmail;
  };
}
