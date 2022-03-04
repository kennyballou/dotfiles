(define-module (kbg services config flatpak)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public flatpak-config-service
  (list (simple-service 'add-flatpak-to-xdg-data-dirs
                        home-environment-variables-service-type
                        '(("XDG_DATA_DIRS" .
                           "${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:${XDG_DATA_HOME}/flatpak/exports/share")))))
