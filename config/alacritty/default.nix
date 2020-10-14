{ pkgs, config, ... }:
{
  xdg.configFile.alacritty = {
    target = "alacritty/alacritty.yml";
    source = ./alacritty.yml;
  };
}
