(define-module (kbg services config chktex)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public chktex-config-service
  (list (simple-service 'chktex-config
                        home-files-service-type
                        `((".chktexrc"
                          ,(local-file (string-append %dotfiles-root "config/chktex/dot-chktexrc")))))))
