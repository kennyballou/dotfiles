{ config, ... }:
{
  home.sessionVariables = {
    LESSHISTFILE = "${config.xdg.cacheHome}/less/history";
  };
}
