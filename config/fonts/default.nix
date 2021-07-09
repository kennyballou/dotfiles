{ ... }:
{
  fonts.fontconfig.enable = true;
  xdg.configFile.fonts = {
    target = "fontconfig/fonts.conf";
    source = ./fonts.conf;
  };
}
