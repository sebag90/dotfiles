{ dotfiles,... }:
{
  # rio config
  home.file.".config/rio/config.toml".source = dotfiles.rio_config;
  home.file.".config/rio/themes/rose-pine.toml".source = dotfiles.rio_theme;

  # zsh config
  home.file.".config/zsh/themes/mytheme.zsh-theme".source = dotfiles.zsh_theme;
  home.file.".config/zsh/zshrc".source = dotfiles.zshrc;
  home.file.".config/zsh/my_functions".source = dotfiles.functions;
  home.file.".config/zsh/my_aliases".source = dotfiles.aliases;

  # helix
  home.file.".config/helix/config.toml".source = dotfiles.helix_config;
}
