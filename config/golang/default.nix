{ config, ... }:
{
  home.sessionVariables = {
    GOPATH = "${config.xdg.cacheHome}/go";
    GO111MODULE = "on";
  };
}
