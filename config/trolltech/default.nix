{ ... }:
let
  theme = "adwaita-dark";
in
{
  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "";
    QT_QPA_PLATFORMTHEME = "gnome";
  };

  xdg.configFile.trolltech = {
    target = "Trolltech.conf";
    text = ''
    [Qt]
    style=${theme}
    '';
  };
}
