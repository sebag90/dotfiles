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

    rio_config = builtins.path {
      name = "rio_config";
      path = ./rio/config.toml;
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
