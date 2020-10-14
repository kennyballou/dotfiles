{ lib, pkgs, config, ... }:
let
  home = config.home;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkUint32 = lib.hm.gvariant.mkUint32;
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/privacy" = {
        "recent-files-max-age" = -1;
        "remove-old-temp-files" = true;
        "remove-old-trash-files" = true;
      };
      "org/gnome/desktop/wm/keybindings" = {
        "activate-window-menu" = "@as []";
        "panel-run-dialog" = [ "<Alt>space" ];
      };
      "org/gnome/settings-daemon/media-keys/custom-keybindings/custom1" = {
        "binding" = "<Alt>Return";
        "command" = "${pkgs.alacritty}/bin/alacritty";
        "name" = "alacritty";
      };
      "org/gnome/desktop/background" = {
        "picture-uri" = "file://${home.homeDirectory}/pictures/wallpapers/background.png";
      };
      "org/gnome/desktop/screensaver" = {
        "picture-uri" = "file://${home.homeDirectory}/pictures/wallpapers/screensaver.png";
      };
      "org/gnome/settings-daemon/plugins/color" = {
        "night-light-enabled" = true;
        "night-light-schedule-automatic" = false;
        "night-light-schedule-from" = 22.0;
        "night-light-schedule-to" = 7.0;
        "night-light-temperature" = mkUint32 2700;
      };
      "org/gnome/desktop/wm/preferences" = {
        "button-layout" = "appmenu:minimize,maximize,close";
        "focus-mode" = "sloppy";  # focus on hover
        "mouse-button-modifier" = "<Alt>";
        "resize-with-right-button" = true;
        "titlebar-font" = "DejaVu Sans 11";
      };
    };
  };
}
