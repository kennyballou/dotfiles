{ pkgs, config, ... }:
{
  home.file.".xbindkeysrc.scm".source = ./xbindkeysrc.scm;

  systemd.user.services.xbindkeys = {
    Unit = {
      Description = "simple xbindkeys service";
      Wants = [];
    };
    Service = {
      Type = "forking";
      ExecStart = "${pkgs.xbindkeys}/bin/xbindkeys";
      Restart = "on-failure";
      TimeoutStartSec = 20;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
