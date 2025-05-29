(define-module (kbg services config gnupg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public gnupg-config-service
  (list (simple-service 'gnupg-config
                        home-files-service-type
                        `((".gnupg/gpg.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/dot-gnupg/gpg.conf")))
                          (".gnupg/scdaemon.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/dot-gnupg/scdaemon.conf")))))))
