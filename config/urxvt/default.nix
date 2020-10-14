{ pkgs, config, ... }:
{
  xdg.configFile.urxvt = {
    target = "Xresources/urxvt";
    source = ./urxvt;
  };
}
