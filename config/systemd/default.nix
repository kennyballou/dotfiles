{ lib, pkgs, ... }:
let
in
{
  systemd.user.timers = {
    org-agenda = {
      Unit = {
        Description = "Timer for Org Agenda File Generation";
      };
      Timer = {
        Persistent = false;
        OnCalendar = "*:0/10:0";
        Unit = "org-agenda.service";
      };
      Install = {
        WantedBy = ["timers.target"];
      };
    };
  };

  systemd.user.services = {
    org-agenda = {
      Unit = {
        Description = "Generate Org Agenda File";
      };
      Service = {
        ExecStart = "${pkgs.emacs-overlay}/bin/emacsclient --quiet --eval '(org-batch-store-agenda-views)'";
      };
      Install = {
        WantedBy = ["default.target"];
      };
    };
  };
}
