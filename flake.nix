{
  outputs = { self }: {
    # expose the file as a derivation
    zshtheme = builtins.path {
      name = "mytheme.zsh-theme";
      path = ./mytheme.zsh-theme;
    };

    myfunctions = builtins.path {
      name = "my_functions";
      path = ./my_functions;
    };

    rioconfig = builtins.path {
      name = "rioconfig";
      path = ./rio/config.toml;
    };

    riotheme = builtins.path {
      name = "riotheme";
      path = ./rio/rose-pine.toml;
    };

    zshrc = builtins.path {
      name = "zshrc";
      path = ./zshrc;
    };
  };
}