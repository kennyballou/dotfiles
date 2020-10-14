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
    gtk3.bookmarks = [
      "file://${home.homeDirectory}/workspace"
      "file://${home.homeDirectory}/workspace/src"
    ];
  };
}
