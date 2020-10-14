{ config, ... }:
{
  home.sessionVariables = {
    SCREENRC = "${config.xdg.configHome}/screen/config";
  };
}
