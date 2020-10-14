{ pkgs, config, ... }:
let
  hostname = config.network.hostname;
in
{
  xdg.configFile.i3 = {
    recursive = true;
    source = ./i3;
    target = "i3";
  };
}
