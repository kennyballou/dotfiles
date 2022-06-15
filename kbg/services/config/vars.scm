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
                        `(("_JAVA_OPTIONS" . "\"-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel\"")
                          ("ASPELL_CONF" . "\"per-conf ${XDG_CONFIG_HOME}/aspell/aspell.conf; personal ${XDG_CONFIG_HOME}/aspell/en.pws; repl ${XDG_CONFIG_HOME}/aspell/en.prepl\"")
                          ("EDITOR" . "emacsclient")
                          ("GUILE_DRMAA_LIBRARY" . ,(file-append slurm-drmaa "/lib/libdrmaa.so"))
                          ("GUIX_EXTENSIONS_PATH" . "${GUIX_PROFILE}/share/guix/extensions")
                          ("GUIX_PROFILE" . "${HOME}/.guix-home/profile")
                          ("MPD_HOST" . "/run/user/1000/mpd/socket")
                          ("PARALLEL_HOME" . "${XDG_CACHE_HOME}/parallel")))))
