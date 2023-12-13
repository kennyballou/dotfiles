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
  #:use-module (kbg services languagetool)
  #:use-module (kbg services mpd)
  #:use-module (kbg services parallel)
  #:use-module (kbg services syncthing)
  #:export (services-for-host))

(define daeva-shepherd-services
  (list (service home-shepherd-service-type
                 (home-shepherd-configuration
                  (services (append gnupg-service
                                    languagetool-service
                                    mpd-service
                                    syncthing-service))))))
(define axo-shepherd-services
  (list (service home-shepherd-service-type
                 (home-shepherd-configuration
                  (services (append gnupg-service
                                    languagetool-service
                                    mpd-service
                                    parallel-mk-temp-dir-service
                                    syncthing-service))))))


(define yak-shepherd-services
  (list (service home-shepherd-service-type
                 (home-shepherd-configuration
                  (services (append gnupg-service
                                    languagetool-service
                                    mpd-service
                                    parallel-mk-temp-dir-service
                                    syncthing-service))))))

(define koi-shepherd-services
  (list (service home-shepherd-service-type
                 (home-shepherd-configuration
                  (services (append gnupg-service
                                    languagetool-service
                                    mpd-service
                                    syncthing-service))))))

(define (services-for-host hostname)
  (cond ((eq? hostname 'daeva)
         daeva-shepherd-services)
        ((eq? hostname 'axo)
         axo-shepherd-services)
        ((eq? hostname 'yak)
         yak-shepherd-services)
        ((eq? hostname 'koi)
         koi-shepherd-services)
        (else '())))
