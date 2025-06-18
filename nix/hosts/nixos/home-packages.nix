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
    ];
}
