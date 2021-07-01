{ config, ... }:
{
  home.sessionVariables = {
    PARALLEL_HOME = "${config.xdg.cacheHome}/parallel";
  };
  home.file.will-cite = {
    target = ".parallel/will-cite";
    text = "\n";
  };
}
