{ config, ... }:
{
  home = {
    file.".nmprc".source = ./npmrc;
    sessionVariables = {
      NPM_PACKAGES = "${config.xdg.dataHome}/npm_packages";
      NODE_PATH = "${config.home.sessionVariables.NPM_PACKAGES}/lib/node_modules";
    };
  };
}
