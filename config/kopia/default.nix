{ pkgs, ... }:
{
  systemd.user.services = {
    "kopia-backups" = {
      Unit = {
        Description = "kopia snapshot the files";
        Wants = "network-online.target";
        After = "network-online.target";
      };

      Service = {
        Type = "simple";
        ExecStart = "${pkgs.kopia-snapshot-sh}/bin/kopia-snapshot.sh";
      };
    };
  };

  systemd.user.timers = {
    "kopia-backups" = {
      Unit = {
        Description = "automatically run backups";
      };

      Timer = {
        OnCalendar = "hourly";
        Persistent = false;
        RandomizedDelaySec = 10;
      };

      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
  };
}
