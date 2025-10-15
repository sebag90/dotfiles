{
  outputs = { self }: {
      # zsh
      zsh_theme = builtins.path {
      name = "mytheme.zsh-theme";
      path = ./zsh/mytheme.zsh-theme;
    };

    functions = builtins.path {
      name = "functions";
      path = ./zsh/functions;
    };

    aliases = builtins.path {
      name = "aliases";
      path = ./zsh/aliases;
    };

    zshrc = builtins.path {
      name = "zshrc";
      path = ./zsh/zshrc;
    };

    # rio
    rio_base_config = builtins.path {
      name = "rio_base_config";
      path = ./rio/base.toml;
    };

    rio_mac_config = builtins.path {
      name = "rio_mac_config";
      path = ./rio/mac.toml;
    };

    rio_nixos_config = builtins.path {
      name = "rio_nixos_config";
      path = ./rio/nixos.toml;
    };
    rio_theme = builtins.path {
      name = "rio_theme";
      path = ./rio/rose-pine.toml;
    };

    # helix
    helix_config = builtins.path {
      name = "helix_config";
      path = ./helix.toml;
    };

    # yazi
    yazi_config = builtins.path {
      name = "yazi_config";
      path = ./yazi/yazi.toml;
    };
    yazi_lua = builtins.path {
      name = "yazi_lua";
      path = ./yazi/init.lua;
    };

    # ghostty
    ghostty_base_config = builtins.path {
      name = "ghostty_base_config";
      path = ./ghostty/config;
    };

    ghostty_mac_config = builtins.path {
      name = "ghostty_mac_config";
      path = ./ghostty/mac.config;
    };

    ghostty_nixos_config = builtins.path {
      name = "ghostty_nixos_config";
      path = ./ghostty/nixos.config;
    };

    ghostty_theme = builtins.path {
      name = "ghostty_theme";
      path = ./ghostty/rose-pine
    };
  };
}
