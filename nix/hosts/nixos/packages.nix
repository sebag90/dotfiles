{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
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
      ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default

      # libreoffice
      libreoffice-qt
      hunspell
      hunspellDicts.it_IT
      hunspellDicts.en_US
      hunspellDicts.de_DE
    ];
}
