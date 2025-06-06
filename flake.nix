{
  outputs = { self }: {
    # expose the file as a derivation
    zshtheme = builtins.path {
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

    rioconfig = builtins.path {
      name = "rioconfig";
      path = ./rio/config.toml;
    };

    riotheme = builtins.path {
      name = "riotheme";
      path = ./rio/rose-pine.toml;
    };
  };
}
