(define-module (kbg services config vale)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public vale-config-service
  (list (simple-service 'vale-config
                        home-files-service-type
                        `(("vale.ini"
                           ,(local-file (string-append %dotfiles-root "config/vale/vale.ini")))
                          ("config/vale/styles"
                           ,(local-file (string-append %dotfiles-root "config/vale/styles")
                                        #:recursive? #t))))))
