(define-module (kbg services config ledger)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public ledger-config-service
  (list (simple-service 'ledger-config
                        home-files-service-type
                        `((".ledgerrc"
                           ,(local-file (string-append %dotfiles-root "config/ledger/ledgerrc")))))))
