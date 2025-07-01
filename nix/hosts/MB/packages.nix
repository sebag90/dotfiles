{ pkgs, ... }:

{
  home.packages = with pkgs; [
    poetry
    nodejs
    gnugrep
  ];
}
