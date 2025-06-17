{
  outputs = { self }: {
    zsh_theme = builtins.path {
      name = "mytheme.zsh-theme";
      path = ./zsh/mytheme.zsh-theme;
    };

    functions = builtins.path {
      name = "my_functions";
      path = ./zsh/my_functions;
    };

    aliases = builtins.path {
      name = "my_aliases";
      path = ./zsh/my_aliases;
    };

    zshrc = builtins.path {
      name = "zshrc";
      path = ./zsh/zshrc;
    };

    base_rio_config = builtins.path {
      name = "base_rio_config";
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
    helix_config = builtins.path {
      name = "helix_config";
      path = ./helix.toml;
    };
  };
}
