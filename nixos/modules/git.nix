let
  secretsPath = builtins.getEnv "DOTFILES_SECRETS";
  secrets = if builtins.pathExists secretsPath then import secretsPath else {};

in
{
  programs.git = {
    enable = true;
    userEmail = secrets.userEmail;
  };
}
