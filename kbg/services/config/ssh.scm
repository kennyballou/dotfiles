(define-module (kbg services config ssh)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:export (ssh-config-service))

(define ssh-config-service
  (list (simple-service 'ssh-config
                        home-files-service-type
                        `((".ssh/config"
                           ,(local-file (string-append %dotfiles-root "config/ssh/ssh/config")))
                          (".ssh/config.d"
                           ,(local-file (string-append %dotfiles-root "config/ssh/ssh/config.d")
                                        #:recursive? #t))))))
