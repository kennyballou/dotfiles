{ pkgs, config, ... }:
{
  xdg.configFile.ranger = {
    recursive = true;
    source = ./ranger;
    target = "ranger";
  };
}
