(define-module (kbg services config direnv)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (kbg packages nix-xyz)
  #:use-module (gnu home services))

(define (direnv-config-text)
  (mixed-text-file "direnvrc"
                   "source " nix-direnv "/share/direnvrc"
                   "\n"))

(define-public direnv-config-service
  (list (simple-service 'direnv-config
                        home-files-service-type
                        `(("config/direnv/direnvrc"
                           ,(direnv-config-text))))))
