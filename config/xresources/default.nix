{ pkgs, config, ... }:
{
  xresources.properties = {
    "xft.antialias" =  true;
    "xft.autohinting" = 0;
    "xft.hinting" = "Full";
    "xft.lcdfilter" = "lcddefault";
    "xft.rgba" = "rgb";
    "Emacs*toolBar" = 0;
    "Emacs.font" = "DejaVu Sans Mono:pixelsize=13";
    "Emacs.FontBackend" = "xft";
    "Xterm*faceName" = "dejavu sans mono";
  };
}
