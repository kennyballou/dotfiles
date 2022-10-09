(define-module (kbg services dict)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services dict)
  #:export (dictionary-service))

(define dictionary-service
  (simple-service 'dictionary-service
                  dicod-service-type
                  (dicod-configuration
                   (interfaces '("localhost"))
                   (databases (list %dicod-database:gcide)))))
