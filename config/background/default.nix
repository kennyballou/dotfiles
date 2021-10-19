{ pkgs, ... }:
let
  background = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Flow/contents/images/5120x2880.jpg";
in {
  systemd.user.services = {
    "background" = {
      Unit = {
        Description = "Set Desktop Background";
      };

      Service = {
        Type = "oneshot";
        ExecStart = "${pkgs.feh}/bin/feh --bg-fill ${background}";
      };
    };
  };
}
