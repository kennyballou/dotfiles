(define-module (kbg services config vars)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:export (home-vars-service))

(define home-vars-service
  (list (simple-service 'home-vars
                        home-environment-variables-service-type
                        '(("ASPELL_CONF" . "\"per-conf ${XDG_CONFIG_HOME}/aspell/aspell.conf; personal ${XDG_CONFIG_HOME}/aspell/en.pws; repl ${XDG_CONFIG_HOME}/aspell/en.prepl\"")
                          ("_JAVA_OPTIONS" . "\"-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel\"")
                          ("MPD_HOST" . "/run/user/1000/mpd/socket")
                          ("EDITOR" . "emacsclient")
                          ("PARALLEL_HOME" . "${XDG_CACHE_HOME}/parallel")))))
