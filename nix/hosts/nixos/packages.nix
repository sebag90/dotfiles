{ pkgs, ghostty, ... }:
{
  home.packages = with pkgs; [
      firefox
      shortwave
      ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default

      # rust
      cargo
      rustfmt

      gcc
      docker-compose
      deja-dup
      soundconverter
      ffmpeg
      solaar
      home-manager
      pinta
      eartag
      impression

      # libreoffice
      libreoffice-qt
      hunspell
      hunspellDicts.it_IT
      hunspellDicts.en_US
      hunspellDicts.de_DE
    ];
}
