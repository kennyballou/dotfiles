{ pkgs, config, ... }:
let
  home-dir = config.home.homeDirectory;
in
{
  xdg.configFile."gtkrc".text = ''
  gtk-theme-name="Adwaita-dark";
  '';

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Adwaita-dark";
    };
    font = {
      name = "DejaVu Sans Book";
      package = pkgs.dejavu_fonts;
      size = 11;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
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
      "file://${home-dir}/workspace"
      "file://${home-dir}/workspace/src"
    ];
  };
}
