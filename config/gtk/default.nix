{ pkgs, config, ... }:
let
  home = config.home;
in
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tela-dark";
      package = null;
    };
    theme = {
      name = "Nordic-darker";
      package = pkgs.nordic;
    };
    font = {
      name = "DejaVu Sans";
      package = pkgs.dejavu_fonts;
      size = 10;
    };
    gtk2.extraConfig = ''
      gtk-enable-animations=1
      gtk-primary-button-warps-slider=0
      gtk-toolbar-style=3
      gtk-menu-images=1
      gtk-button-images=1
      gtk-cursor-theme-size=24
    '';
    gtk3.bookmarks = [
      "file://${home.homeDirectory}/workspace"
      "file://${home.homeDirectory}/workspace/src"
    ];
  };
}
