(define-module (kbg services gnupg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services gnupg)
  #:use-module (gnu packages gnupg)
  #:export (gnupg-service))

(define gnupg-service
  (service home-gpg-agent-service-type
           (home-gpg-agent-configuration
            (pinentry-program
             (file-append pinentry-gnome3 "/bin/pinentry-gnome3"))
            (default-cache-ttl 28800)
            (max-cache-ttl 43200)
            (ssh-support? #t)
            (extra-content (string-join '("allow-emacs-pinentry"
                                          "allow-loopback-pinentry") "\n")))))
