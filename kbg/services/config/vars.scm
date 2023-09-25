(define-module (kbg services config vars)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (gnu packages parallel)
  #:export (home-vars-service))

(define home-vars-service
  (list (simple-service 'home-vars
                        home-environment-variables-service-type
                        `(("_JAVA_OPTIONS" . "-Dawt.useSystemAAFontSettings=on")
                          ("ASPELL_CONF" . "per-conf ${XDG_CONFIG_HOME}/aspell/aspell.conf; personal ${XDG_CONFIG_HOME}/aspell/en.pws; repl ${XDG_CONFIG_HOME}/aspell/en.prepl")
                          ("CALIBRE_USE_DARK_PALETTE" . "1")
                          ("EDITOR" . "emacsclient")
                          ("GUILE_DRMAA_LIBRARY" . ,(file-append slurm-drmaa "/lib/libdrmaa.so"))
                          ("GUIX_EXTENSIONS_PATH" . "${GUIX_PROFILE}/share/guix/extensions")
                          ("GUIX_PROFILE" . "${HOME}/.guix-home/profile")
                          ("MPD_HOST" . "/run/user/1000/mpd/socket")
                          ("NAUTILUS_EXTENSION_PATH" . "/run/current-system/profile/lib/nautilus/site-extensions")
                          ("PARALLEL_HOME" . "${XDG_CACHE_HOME}/parallel")
                          ("XDG_DATA_DIRS" . ,(string-append "${XDG_DATA_DIRS}:/var/lib/flatpak/exports/share:"
                                                             "${XDG_DATA_HOME}/flatpak/exports/share"))))))
