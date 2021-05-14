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
      "org/gnome/desktop/interface" = {
        "font-name" = "DejaVu Sans 10";
        "monospace-font-name" = "DejaVu Sans Mono 10";
        "gtk-im-module" = "gtk-im-context-simple";
        "gtk-theme" = "Nordic-darker";
        "icon-theme" = "Tela-dark";
        "locate-pointer" = false;
        "show-battery-percentage" = true;
        "clock-show-date" = true;
        "clock-show-seconds" = false;
        "clock-show-weekday" = false;
      };
      "org/gnome/desktop/media-handling" = {
        "autorun-never" = true;
      };
      "org/gnome/desktop/wm/keybindings" = {
        "move-to-workspace-1" = "@as []";
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
        "focus-mode" = "strict";
        "mouse-button-modifier" = "<Alt>";
        "resize-with-right-button" = true;
        "titlebar-font" = "DejaVu Sans 11";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "gsconnect@andyholms.github.io"
        ];
        favorite-apps = [
          "firefox.desktop"
          "chromium-browser.desktop"
          "emacs.desktop"
          "Alacritty.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Nautilus.desktop"
          "gnome-control-center.desktop"
        ];
      };
    };
  };
}
