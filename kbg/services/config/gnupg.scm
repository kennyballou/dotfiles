(define-module (kbg services config gnupg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public gnupg-config-service
  (list (simple-service 'gnupg-config
                        home-files-service-type
                        `(("gnupg/gpg.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/gpg.conf")))
                          ("gnupg/gpg-agent.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/gpg-agent.conf")))
                          ("gnupg/scdaemon.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/scdaemon.conf")))))))
