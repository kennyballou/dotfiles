{ pkgs, config, ... }:
let
  home = config.home;
in
{
  xdg.configFile."gtkrc".text = ''
  include "${pkgs.nordic}/share/themes/Nordic-darker/gtk-2.0/gtkrc"
  gtk-theme-name="Nordic-darker";
  '';

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
      size = 10;
    };
    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-enable-event-sounds=1
      gtk-enable-input-feedback-sounds=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
      gtk-cursor-theme-size=24
      gtk-cursor-theme-name="breeze_cursors"
      gtk-xft-antialias=1
      gtk-xft-hinting=1
      gtk-xft-hintstyle="hintslight"
      gtk-xft-rgba="rgb"
    '';
    gtk3.bookmarks = [
      "file://${home.homeDirectory}/workspace"
      "file://${home.homeDirectory}/workspace/src"
    ];
  };
}
