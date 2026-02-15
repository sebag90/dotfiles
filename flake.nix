{
  outputs = { self }: {
    # zsh
    zsh_theme = builtins.path {
      name = "mytheme.zsh-theme";
      path = ./config/zsh/mytheme.zsh-theme;
    };

    zsh_functions = builtins.path {
      name = "functions";
      path = ./config/zsh/functions;
    };

    zsh_aliases = builtins.path {
      name = "aliases";
      path = ./config/zsh/aliases;
    };

    zshrc = builtins.path {
      name = "zshrc";
      path = ./config/zsh/zshrc;
    };

    # rio
    rio_base_config = builtins.path {
      name = "rio_base_config";
      path = ./config/rio/base.toml;
    };

    rio_mac_config = builtins.path {
      name = "rio_mac_config";
      path = ./config/rio/mac.toml;
    };

    rio_nixos_config = builtins.path {
      name = "rio_nixos_config";
      path = ./config/rio/nixos.toml;
    };
    rio_theme = builtins.path {
      name = "rio_theme";
      path = ./config/rio/rose-pine.toml;
    };

    # helix
    helix_config = builtins.path {
      name = "helix_config";
      path = ./config/helix;
    };

    # yazi
    yazi_config = builtins.path {
      name = "yazi_config";
      path = ./config/yazi/yazi.toml;
    };
    yazi_lua = builtins.path {
      name = "yazi_lua";
      path = ./config/yazi/init.lua;
    };

    # ghostty
    ghostty_base_config = builtins.path {
      name = "ghostty_base_config";
      path = ./config/ghostty/config;
    };

    ghostty_mac_config = builtins.path {
      name = "ghostty_mac_config";
      path = ./config/ghostty/mac.config;
    };

    ghostty_nixos_config = builtins.path {
      name = "ghostty_nixos_config";
      path = ./config/ghostty/nixos.config;
    };

    ghostty_theme = builtins.path {
      name = "ghostty_theme";
      path = ./config/ghostty/rose-pine;
    };

    # zellij
    zellij_config = builtins.path {
      name = "zellij_config";
      path = ./config/zellij/config.kdl;
    };

    zellij_theme = builtins.path {
      name = "zellij_theme";
      path = ./config/zellij/themes/rose-pine.kdl;
    };

    # fish
    fish_configs = builtins.path {
      name = "fish_configs";
      path = ./config/fish/configs;
    };

    fish_themes = builtins.path {
      name = "fish_themes";
      path = ./config/fish/themes;
    };

    fish_functions = builtins.path {
      name = "fish_functions";
      path = ./config/fish/functions;
    };
  };
}
