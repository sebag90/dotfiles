{ dotfiles, hostname, ... }:

let
  base = builtins.readFile dotfiles.rio_base_config;
  mac  = builtins.readFile dotfiles.rio_mac_config;
  nix  = builtins.readFile dotfiles.rio_nixos_config;

  combinedRioConfig = if hostname == "MB" then
    base + "\n" + mac
  else
    base + "\n" + nix;
in
{
  # rio config
  home.file.".config/rio/config.toml".text = combinedRioConfig;
  home.file.".config/rio/themes/rose-pine.toml".source = dotfiles.rio_theme;

  # zsh config
  home.file.".config/zsh/themes/mytheme.zsh-theme".source = dotfiles.zsh_theme;
  home.file.".config/zsh/zshrc".source = dotfiles.zshrc;
  home.file.".config/zsh/my_functions".source = dotfiles.functions;
  home.file.".config/zsh/my_aliases".source = dotfiles.aliases;

  # helix
  home.file.".config/helix/config.toml".source = dotfiles.helix_config;
}
