{ config, hostname, dotfiles_dir, ... }:

let
  secretsPath = "${config.home.homeDirectory}/${dotfiles_dir}/nix/hosts/${hostname}/secrets.nix";
  secrets = if builtins.pathExists secretsPath then import secretsPath else {};
in {
  programs.git = {
    enable = true;
    userEmail = secrets.userEmail;
  };
}
