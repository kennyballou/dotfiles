{ pkgs, config, ... }:
{
  xdg.configFile.dir-colors = {
    target = "DIR_COLORS";
    source = ./DIR_COLORS;
  };
}
