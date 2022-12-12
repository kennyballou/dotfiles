(define-module (kbg services config nyxt)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (kbg packages nyxt-extensions))

(define-public nyxt-config-service
  (list (simple-service 'nyxt-config
                        home-files-service-type
                        `((".config/nyxt/init.lisp"
                           ,(local-file (string-append %dotfiles-root "config/nyxt/init.lisp")))
                          (".config/nyxt/freestance.lisp"
                           ,(local-file (string-append %dotfiles-root "config/nyxt/freestance.lisp")))
                          (".local/share/nyxt/extensions/nx-freestance-handler"
                           ,nx-freestance-handler)))))
