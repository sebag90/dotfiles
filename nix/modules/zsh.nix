{config, dotfiles_dir, ...}: {
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
    };
    oh-my-zsh = {
      enable = true;
      theme = "mytheme";
    };
  };
}
