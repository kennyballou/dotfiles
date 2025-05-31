(define-module (kbg services timers borg)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (kbg)
  #:use-module (kbg private-data)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu packages backup)
  #:use-module (kbg services borg)
  #:export (borg-backup-timer
            borg-prune-timer))

(define borg-backup-timer
  (let ((borg-backup (shepherd-timer '(borg-backup)
                                     #~(calendar-event #:minutes '(45))
                                     borg-backup-job)))
    (simple-service 'borg-backup
                    home-shepherd-service-type
                    (list borg-backup))))

(define borg-prune-timer
  (let ((borg-prune (shepherd-timer '(borg-prune)
                                    #~(calendar-event #:hours '(4)
                                                      #:minutes '(4))
                                    borg-prune-job)))
    (simple-service 'borg-prune
                    home-shepherd-service-type
                    (list borg-prune))))
