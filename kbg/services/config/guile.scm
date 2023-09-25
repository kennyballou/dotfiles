(define-module (kbg services config guile)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public guile-config-service
  (list (simple-service 'guile-config
                        home-files-service-type
                        `((".guile"
                           ,(local-file (string-append %dotfiles-root "config/guile/guile.scm")))))))
