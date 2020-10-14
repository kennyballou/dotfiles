{ pkgs, config, ... }:
{
  xdg.configFile.dunstrc = {
    target = "dunst/dunstrc";
    source = ./dunstrc;
  };
}
