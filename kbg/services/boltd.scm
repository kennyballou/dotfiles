(define-module (kbg services boltd)
  #:use-module (ice-9 match)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (guix modules)
  #:use-module (gnu system shadow)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu services dbus)
  #:use-module (gnu packages linux)
  #:export (boltd-configuration
            boltd-configuration?
            boltd-service-type))


(define-record-type* <boltd-configuration>
  boltd-configuration make-boltd-configuration boltd-configuration?
  (package boltd-configuration-package ; package
           (default bolt)))

(define (boltd-shepherd-service config)
  (shepherd-service
   (documentation "Thunderbolt daemon")
   (provision '(boltd))
   (requirement '(dbus-system udev))
   (respawn? #f)
   (start #~(make-forkexec-constructor
             (list #$(file-append (boltd-configuration-package config)
                                  "/libexec/boltd")
                   "--verbose")
             #:log-file "/var/log/boltd"))
   (stop #~(make-kill-destructor))))

(define boltd-activation-service
  #~(begin
      (use-modules (guix build utils))
      (mkdir-p "/var/lib/boltd")))

(define (boltd-udev-rule config)
  (let ((package (boltd-configuration-package config)))
    (file->udev-rule "90-bolt.rules"
                     (file-append package
                                  "/lib/udev/rules.d/90-bolt.rules"))))

(define boltd-service-type
  (service-type
   (name 'boltd)
   (description
    "Run @command{boltd}, the Thunderbolt daemon.")
   (extensions
    (list (service-extension udev-service-type
                             (compose list boltd-udev-rule))
     (service-extension activation-service-type
                             (const boltd-activation-service))
          (service-extension dbus-root-service-type
                             (compose list boltd-configuration-package))
          (service-extension shepherd-root-service-type
                             (compose list boltd-shepherd-service))))
   (default-value (boltd-configuration))))
