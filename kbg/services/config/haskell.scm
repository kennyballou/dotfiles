(define-module (kbg services config haskell)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public haskell-config-service
  (list (simple-service 'haskell-config
                        home-files-service-type
                        `((".ghci"
                           ,(local-file (string-append %dotfiles-root "config/ghci/dot-ghci")))))))
