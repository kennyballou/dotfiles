{ pkgs, config, ... }:
{
  xdg.configFile.terminator = {
    source = ./config;
    target = "terminator/config";
  };
}
