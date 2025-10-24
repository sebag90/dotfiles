{config, dotfiles_dir, hostname, ...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    initContent = ''
      source ${config.home.homeDirectory}/.config/zsh/zshrc
    '';
    sessionVariables = {
      ZSH_CUSTOM = "${config.home.homeDirectory}/.config/zsh";
      DOTFILES_DIR = "${config.home.homeDirectory}/${dotfiles_dir}";
      NIX_HOSTNAME = "${hostname}";
    };
    oh-my-zsh = {
      enable = true;
      theme = "mytheme";
    };

    shellAliases = if hostname == "MB" then {
      clipboard = "pbcopy";
    } else {};
  };
}
