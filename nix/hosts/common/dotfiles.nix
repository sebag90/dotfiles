{ dotfiles, hostname, ... }:

  let
  rio_base = builtins.readFile dotfiles.rio_base_config;
  rio_mac  = builtins.readFile dotfiles.rio_mac_config;
  rio_nix  = builtins.readFile dotfiles.rio_nixos_config;

  ghostty_base = builtins.readFile dotfiles.ghostty_base_config;
  ghostty_mac  = builtins.readFile dotfiles.ghostty_mac_config;
  ghostty_nix  = builtins.readFile dotfiles.ghostty_nixos_config;


  cfg =
    if hostname == "MB" then {
      rio_config = rio_base + "\n" + rio_mac;
      ghostty_config = ghostty_base + "\n" + ghostty_mac;
    } else {
      rio_config = rio_base + "\n" + rio_nix;
      ghostty_config = ghostty_base + "\n" + ghostty_nix;
    };
in
{
  # rio config
  home.file.".config/rio/config.toml".text = cfg.rio_config;
  home.file.".config/rio/themes/rose-pine.toml".source = dotfiles.rio_theme;

  # zsh config
  home.file.".config/zsh/themes/mytheme.zsh-theme".source = dotfiles.zsh_theme;
  home.file.".config/zsh/zshrc".source = dotfiles.zshrc;
  home.file.".config/zsh/functions".source = dotfiles.functions;
  home.file.".config/zsh/aliases".source = dotfiles.aliases;

  # helix
  home.file.".config/helix/config.toml".source = dotfiles.helix_config;

  # yazi
  home.file.".config/yazi/yazi.toml".source = dotfiles.yazi_config;
  home.file.".config/yazi/init.lua".source = dotfiles.yazi_lua;

  # ghostty
  home.file.".config/ghostty/config".text = cfg.ghostty_config;
  home.file.".config/ghostty/themes/rose-pine".source = dotfiles.ghostty_theme;
}
