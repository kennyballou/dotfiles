(define-module (kbg services shepherd)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services audio)
  #:use-module (system repl server)
  #:use-module (kbg services gnupg)
  #:use-module (kbg services mcron)
  #:use-module (kbg services mpd)
  #:export (services-for-host))

(define daeva-shepherd-services
  (list (service home-shepherd-service-type
                 (home-shepherd-configuration
                  (services (append gnupg-service
                                    mpd-service))))))

(define (services-for-host hostname)
  (cond ((eq? hostname 'daeva)
         daeva-shepherd-services)
        (else '())))
