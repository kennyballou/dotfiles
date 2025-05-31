(define-module (kbg services timers guix-gc)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (kbg)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu services shepherd)
  #:export (guix-gc-timer
            guix-gc-repair-timer))

(define guix-gc-timer
  (shepherd-timer '(guix-gc)
                  #~(calendar-event #:hours '(12)
                                    #:minutes '(3))
                  #~("/run/current-system/profile/bin/guix"
                     "gc" "--delete-generations=14d")
                  #:requirement '(guix-daemon)))

(define guix-gc-repair-timer
  (shepherd-timer '(guix-gc-repair)
                  #~(calendar-event #:hours '(8)
                                    #:minutes '(30))
                  #~("/run/current-system/profile/bin/guix"
                     "gc" "--verify=contents,repair")
                  #:requirement '(guix-daemon)))

