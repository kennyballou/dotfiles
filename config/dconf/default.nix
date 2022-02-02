{ lib, pkgs, config, ... }:
let
  home = config.home;
  mkTuple = lib.hm.gvariant.mkTuple;
  mkArray = lib.hm.gvariant.mkArray;
  mkUint32 = lib.hm.gvariant.mkUint32;
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/clocks" = {
        world-clocks = "[{'location': <(uint32 2, <('Anywhere on Earth (AoE)', '@AoE', false, @a(dd) [], @a(dd) [])>)>}, {'location': <(uint32 2, <('Coordinated Universal Time (UTC)', '@UTC', false, @a(dd) [], @a(dd) [])>)>}]";
      };
      "org/gnome/GWeather" = {
        temperature-unit = "centigrade";
      };
      "org/gnome/mutter" = {
        "dynamic-workspaces" = true;
      };
      "org/gnome/desktop/privacy" = {
        "recent-files-max-age" = -1;
        "remove-old-temp-files" = true;
        "remove-old-trash-files" = true;
      };
      "org/gnome/desktop/interface" = {
        "font-name" = "DejaVu Sans Book 11";
        "monospace-font-name" = "DejaVu Sans Mono 11";
        "gtk-im-module" = "gtk-im-context-simple";
        "gtk-theme" = "Adwaita-dark";
        "icon-theme" = "Papirus-Dark";
        "locate-pointer" = false;
        "show-battery-percentage" = true;
        "clock-show-date" = true;
        "clock-show-seconds" = false;
        "clock-show-weekday" = false;
      };
      "org/gnome/desktop/peripherals/mouse" = {
        "accel-profile" = "adaptive";
        "natural-scroll" = false;
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        "natural-scroll" = false;
        "tap-to-click" = true;
        "two-finger-scrolling-enabled" = true;
      };
      "org/gnome/desktop/media-handling" = {
        "autorun-never" = true;
      };
      "org/gnome/desktop/wm/keybindings" = {
        "activate-window-menu" = [];
        "cycle-group" = [];
        "cycle-group-backward" = [];
        "cycle-panels" = [];
        "cycle-panels-backward" = [];
        "cycle-windows" = [];
        "cycle-windows-backward" = [];
        "maximize-vertically" = [ "<Super>Up" ];
        "move-to-monitor-down" = [];
        "move-to-monitor-left" = [];
        "move-to-monitor-right" = [];
        "move-to-monitor-up" = [];
        "move-to-workspace-1" = [];
        "move-to-workspace-last" = [];
        "move-to-workspace-left" = [ "<Primary><Shift><Super>Left" ];
        "move-to-workspace-right" = [ "<Primary><Shift><Super>Right" ];
        "panel-run-dialog" = ["<Alt>F2"];
        "switch-applications" = [];
        "switch-applications-backward" = [];
        "switch-group" = [];
        "switch-group-backward" = [];
        "switch-panels" = [];
        "switch-panels-backward" = [];
        "switch-to-workspace-1" = [];
        "switch-to-workspace-last" = [];
        "switch-to-workspace-left" = [ "<Primary><Super>Left" ];
        "switch-to-workspace-right"= [ "<Primary><Super>Right" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        "custom-keybindings" = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        ];
        "help" = [];
        "home" = [ "<Super>e" ];
        "next" = [ "AudioNext" ];
        "play" = [ "AudioPlay" ];
        "previous" = [ "AudioPrev" ];
        "screensaver" = [ "<Primary><Alt>l" ];
        "screenshot" = [ "Print" ];
        "volume-down" = [ "AudioLowerVolume" ];
        "volume-mute" = [ "AudioMute" ];
        "volume-up" = [ "AudioRaiseVolume" ];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        "binding" = "<Alt>Return";
        "command" = "${pkgs.kitty}/bin/kitty";
        "name" = "alacritty";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        "binding" = "<Alt>space";
        "command" = "${pkgs.rofi}/bin/rofi -show combi";
        "name" = "rofi";
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        "binding" = "<Alt>Tab";
        "command" = "${pkgs.rofi}/bin/rofi -show windowcd";
        "name" = "rofi windowcd";
      };
      "org/gnome/desktop/background" = {
        "picture-uri" = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Flow/contents/images/5120x2880.jpg";
      };
      "org/gnome/desktop/screensaver" = {
        "picture-uri" = "${pkgs.plasma-workspace-wallpapers}/share/wallpapers/Flow/contents/images/5120x2880.jpg";
      };
      "org/gnome/settings-daemon/plugins/color" = {
        "night-light-enabled" = true;
        "night-light-schedule-automatic" = false;
        "night-light-schedule-from" = 22.0;
        "night-light-schedule-to" = 7.0;
        "night-light-temperature" = mkUint32 2700;
      };
      "org/gnome/desktop/wm/preferences" = {
        "action-middle-click-titlebar" = "toggle-maximize-vertically";
        "button-layout" = "appmenu:minimize,maximize,close";
        "focus-mode" = "strict";
        "mouse-button-modifier" = "<Alt>";
        "resize-with-right-button" = true;
        "titlebar-font" = "DejaVu Sans 11";
      };
      "org/gnome/shell/extensions/sound-output-device-chooser" = {
        "hide-menu-icons" = true;
        "hide-on-single-device" = true;
        "icon-theme" = "monochrome";
        "show-input-devices" = true;
        "show-input-slider" = true;
        "show-profiles" = true;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "apps-menu@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "sound-output-device-chooser@kgshank.net"
          "gsconnect@andyholms.github.io"
        ];
        favorite-apps = [
          "firefox.desktop"
          "chromium-browser.desktop"
          "emacs.desktop"
          "kitty.desktop"
          "org.gnome.Calendar.desktop"
          "org.gnome.Nautilus.desktop"
          "gnome-control-center.desktop"
        ];
      };
      "org/gnome/tweaks" = {
        "show-extensions-notice" = false;
      };
    };
  };
}
