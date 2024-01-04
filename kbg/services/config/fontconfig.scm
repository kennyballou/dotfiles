(define-module (kbg services config fontconfig)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (gnu home services fontutils)
  #:export (font-config-service))

(define font-config-service
  (list (simple-service 'additional-fonts-service
                        home-fontconfig-service-type
                        (list))))
