{config, ...}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    history.size = 10000;
    initContent = ''
      source ${config.home.homeDirectory}/.config/zsh/zshrc
    '';
    sessionVariables = {
      ZSH_CUSTOM = "${config.home.homeDirectory}/.config/zsh";
      NIX_BUILD_EXEC = "nixos-rebuild";
      DOTFILES_SECRETS = "${config.home.homeDirectory}/code/dotfiles/nixos/hosts/nixos/secrets.nix";
    };
    oh-my-zsh = {
      enable = true;
      theme = "mytheme";
    };
  };
}
