{ pkgs, config, ...}:
{
  xdg.mimeApps = {
    enable = true;
    associations = {
    };
    defaultApplications = {
      "all/text" = [ "emacsclient.desktop" "emacs.desktop" ];
      "applicaiton/vnd.openxmlformats--officedocument.wordprocessingxml.documentappliation/zip" = [ "libreoffice.desktop" ];
      "application/jpg"= [ "org.gnome.eog.desktop" "gimp.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "application/vnd.ms-excel" = [ "libreoffice.desktop" ];
      "image/gif" = [ "org.gnome.eog.desktop" "gimp.desktop" ];
      "image/jpeg" = [ "org.gnome.eog.desktop" "gimp.desktop" ];
      "image/png" = [ "org.gnome.eog.desktop" "gimp.desktop" ];
      "inode/directory" = [ "org.Gnome.Nautilus.desktop" ];
      "text/html" = [ "emacsclient.desktop" "emacs.desktop" "firefox.desktop" "chromium-browser.desktop" ];
      "text/plain" = [ "emacsclient.desktop" "emacs.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "emacsclient.desktop" ];

    };
  };
}
