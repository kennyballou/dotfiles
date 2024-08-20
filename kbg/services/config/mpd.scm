(define-module (kbg services config mpd)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define (mpd-file fname)
  (string-append ".config/mpd/" fname))

(define-public mpd-config-service
  (list (simple-service 'mpd-config
                        home-files-service-type
                        `((,(mpd-file "mpd.conf")
                           ,(local-file (string-append %dotfiles-root "config/mpd/dot-config/mpd/mpd.conf")))
                          (".config/mpDris2/dot-config/mpdris2/mpDris2.conf"
                           ,(local-file (string-append %dotfiles-root "config/mpdris2/mpDris2.conf")))))))
