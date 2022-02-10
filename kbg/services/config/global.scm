(define-module (kbg services config global)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public global-config-service
  (list (simple-service 'global-config
                        home-files-service-type
                        `(("globalrc"
                           ,(local-file (string-append %dotfiles-root "config/global/globalrc")))))))
