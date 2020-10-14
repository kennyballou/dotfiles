{ config, ... }:
{
  home.sessionVariables = {
    CABAL_CONFIG = "${config.xdg.configHome}/cabal/config";
  };
  xdg.configFile.cabal = {
    source = ./config;
    target = "cabal/config";
  };
}
