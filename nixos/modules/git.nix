let
  secretsPath = /home/seba/code/dotfiles/nixos/hosts/nixos/secrets.nix; #builtins.getEnv "DOTFILES_SECRETS";
  secrets = if builtins.pathExists secretsPath then import secretsPath else {};

in
{
  programs.git = {
    enable = true;
    userEmail = secrets.userEmail;
  };
}
