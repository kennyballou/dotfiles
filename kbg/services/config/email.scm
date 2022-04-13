(define-module (kbg services config email)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public email-config-service
  (list (simple-service 'email-config
                        home-files-service-type
                        `((".mbsyncrc"
                           ,(local-file (string-append %dotfiles-root "config/email/mbsyncrc")))
                          (".config/msmtp/config"
                           ,(local-file (string-append %dotfiles-root "config/email/msmtprc")))))))
