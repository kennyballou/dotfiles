{ pkgs, ... }:
let
  home-dir = builtins.getEnv "HOME";
  background = "${home-dir}/pictures/wallpapers/background.png";
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
