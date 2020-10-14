{ pkgs, config, ... }:
{
  xdg.configFile.newsboat = {
    recursive = true;
    source = ./config;
    target = "newsboat/config";
  };
}
