(define-module (kbg services config shepherd)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public shepherd-user-services
  (list (simple-service 'shepherd-user-services
                        home-files-service-type
                        `((".config/shepherd/init.scm"
                           ,(local-file (string-append %dotfiles-root "config/shepherd/init.scm")))
                          (".config/shepherd/init.d"
                           ,(local-file (string-append %dotfiles-root "config/shepherd/init.d")
                                        #:recursive? #t))))))
