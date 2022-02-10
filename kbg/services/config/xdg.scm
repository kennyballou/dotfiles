(define-module (kbg services config xdg)
  #:use-module (gnu home services)
  #:use-module (gnu home services xdg)
  #:export (xdg-config-service))

(define xdg-config-service
  (list (service home-xdg-mime-applications-service-type
                 (home-xdg-mime-applications-configuration
                  (default '((all/text . emacsclient)
                             (application/pdf . evince)
                             (application/jpg . (eog gimp))
                             (image/gif . (eog gimp))
                             (image/jpeg . (eog gimp))
                             (image/png . (eog gimp))
                             (inode/direcotory . nautilus)
                             (text/plain . emacsclient)
                             (text/x-java . emacsclient)
                             (text/x-makefile . emacsclient)
                             (text/x-shellscript . emacsclient)
                             (text/html . emacsclient)))))
        (service home-xdg-user-directories-service-type
                 (home-xdg-user-directories-configuration
                  (desktop "$HOME/desktop")
                  (documents "$HOME/documents")
                  (download "$HOME/downloads")
                  (music "$HOME/music")
                  (pictures "$HOME/pictures")
                  (publicshare "$HOME/public")
                  (templates "$HOME")
                  (videos "$HOME")))))
