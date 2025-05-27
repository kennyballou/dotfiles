(define-module (kbg services config xresources)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:export (xresources-config-service))

(define xresources-config-service
  (list (simple-service 'xresources-config
                        home-files-service-type
                        `((".Xresources"
                           ,(local-file (string-append %dotfiles-root "config/xresources/dot-config/X11/Xresources")))
                          (".Xresources.d"
                           ,(local-file (string-append %dotfiles-root" config/xresources/dot-config/X11/Xresources.d")
                                        #:recursive? #t))))))
