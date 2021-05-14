{ pkgs, config, ...}:
{
  xdg.mimeApps = {
    enable = true;
    associations = {
      added = {
        "image/gif" = [ "gimp.desktop" "org.kde.gwenview.desktop" ];
        "image/jpeg" = [ "gimp.desktop" "org.kde.gwenview.desktop" ];
        "image/png" = [ "gimp.desktop" "org.kde.gwenview.desktop" ];
      };
      removed = {};
    };
    defaultApplications = {
      "all/text" = [ "emacsclient.desktop" "emacs.desktop" ];
      "applicaiton/vnd.openxmlformats--officedocument.wordprocessingxml.documentappliation/zip" = [
        "libreoffice.desktop" ];
      "application/jpg"= [ "org.kde.gwenview.desktop" "gimp.desktop" ];
      "application/pdf" = [ "org.kde.okular.desktop" ];
      "application/x-wwf" = [ "org.kde.okular.desktop" ];
      "application/x-gzpdf" = [ "org.kde.okular.desktop" ];
      "application/x-bzpdf" = [ "org.kde.okular.desktop" ];
      "application/vnd.ms-excel" = [ "libreoffice.desktop" ];
      "image/gif" = [ "org.kde.gwenview.desktop" "gimp.desktop" ];
      "image/jpeg" = [ "org.kde.gwenview.desktop" "gimp.desktop" ];
      "image/png" = [ "org.kde.gwenview.desktop" "gimp.desktop" ];
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
      "text/html" = [ "emacsclient.desktop" "emacs.desktop" "firefox.desktop" "chromium-browser.desktop" ];
      "text/plain" = [ "emacsclient.desktop" "emacs.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "emacsclient.desktop" ];

    };
  };
}
