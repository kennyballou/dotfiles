(define-module (kbg services timers recoll)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (kbg)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu packages search)
  #:export (recoll-timer-service))

(define recoll-timer-service
  (let ((recoll-indexer (shepherd-timer '(update-recoll-index)
                                        #~(calendar-event #:hours '(3 15)
                                                          #:minutes '(15))
                                        #~(#$(file-append recoll "/bin/recollindex")))))
    (simple-service 'update-recoll-index-service
                    home-shepherd-service-type
                    (list recoll-indexer))))
