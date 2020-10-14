{ config, ... }:
{
  home.sessionVariables = {
    PARALLEL_HOME = "${config.xdg.cacheHome}/parallel";
  };
}
