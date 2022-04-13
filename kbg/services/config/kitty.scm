(define-module (kbg services config kitty)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:export (kitty-config-service))

(define kitty-config-service
  (list (simple-service 'kitty-config
                        home-files-service-type
                        `((".config/kitty/kitty.conf"
                           ,(local-file (string-append %dotfiles-root "config/kitty/kitty.conf")))))))
