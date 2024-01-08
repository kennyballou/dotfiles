(define-module (kbg packages profiles laptop)
  #:use-module (gnu packages linux)
  #:use-module (kbg packages crates-io)
  #:export (%kbg-laptop-packages))

(define %kbg-laptop-packages
  (list rust-battop-0.2
        bolt))
