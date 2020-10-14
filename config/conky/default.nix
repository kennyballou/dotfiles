{ pkgs, config, ... }:
{
  xdg.configFile.conky = {
    recursive = true;
    target = "conky";
    source = ./conky;
  };
}
