(define-module (kbg services mcron snitch)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1)
  #:use-module (kbg)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (gnu)
  #:use-module (gnu home)
  #:use-module (gnu home services)
  #:use-module (gnu home services mcron)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (gnu packages games)
  #:export (snitch-mcron-service-type
            snitch-mcron-configuration
            snitch-mcron-configuration?
            snitch-mcron-configuration-package
            snitch-mcron-configuration-schedule))

(define (string-or-gexp? obj)
  (or (string? obj) (gexp? obj)))

(define string-list?
  (match-lambda
    (((? string?) ...) #t)
    (_ #f)))

(define-configuration/no-serialization snitch-mcron-configuration
  (package
    (file-like cowsay)
    "The cowsay package to use.")
  (schedule
   (string-or-gexp "*/2 * * * *")
   "String or G-exp denoting mcron schedule for periodic snitching..."))

(define (snitch-job configuration)
  (match-record configuration <snitch-mcron-configuration>
                (package schedule)
    (let ((snitch (program-file
                   "snitch"
                   #~(begin
                       (execl #$(file-append package "/bin/cowsay")
                              "cowsay"
                              "-f" #$(file-append package "/share/cowsay/cows/dragon.cow")'
                              "The system is down.")))))
    (list #~(job #$schedule #$snitch)))))

(define snitch-mcron-service-type
  (service-type
   (name 'snitch-mcron-service)
   (extensions
    (list (service-extension home-mcron-service-type
                             snitch-job)))
   (description "Test mcron jobs to test mcron")
   (default-value (snitch-mcron-configuration))))
