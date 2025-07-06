{ pkgs, ... }:
{
  home.packages = with pkgs; [
      firefox
      cargo
      gcc
      docker-compose
      deja-dup
      soundconverter
      ffmpeg
      solaar
      home-manager
      pinta
      ghostty
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
