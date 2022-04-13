(define-module (kbg services config guix)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public guix-config-service
  (list (simple-service 'guix-config
                        home-files-service-type
                        `((".config/guix/channels.scm"
                           ,(local-file (string-append %dotfiles-root "config/guix/channels.scm")))
                          (".config/guix/shell-authorized-directories"
                           ,(local-file (string-append %dotfiles-root "config/guix/shell-authorized-directories")))))))
