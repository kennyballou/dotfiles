{ pkgs, config, ... }:
{
  xdg.configFile.openbox-rc = {
    source = ./rc.xml;
    target = "openbox/rc.xml";
  };

  xdg.configFile.openbox-autostart = {
    text = ''
    #!/usr/bin/env bash
    ${pkgs.procps}/bin/pkill stalonetray
    ${pkgs.procps}/bin/pkill lemon
    ${pkgs.lemonbar-sh}/bin/lemon.sh &
    ${pkgs.stalonetray}/bin/stalonetray &
    '';
    target = "openbox/autostart";
    executable = true;
  };

  # xdg.configFile.openbox-menu = {
  #   source = ./menu.xml;
  #   target = "openbox/menu.xml";
  # };
}
