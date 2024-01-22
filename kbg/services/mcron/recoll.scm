(define-module (kbg services mcron recoll)
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
  #:use-module (gnu packages search)
  #:export (recoll-mcron-service-type
            recoll-mcron-configuration
            recoll-mcron-configuration?
            recoll-mcron-configuration-package
            recoll-mcron-configuration-schedule))

(define (string-or-gexp? obj)
  (or (string? obj) (gexp? obj)))

(define string-list?
  (match-lambda
    (((? string?) ...) #t)
    (_ #f)))

(define-configuration/no-serialization recoll-mcron-configuration
  (package
    (file-like recoll)
    "The recoll package to use.")
  (schedule
   (string-or-gexp "30 3 * * *")
   "String or G-exp denoting mcron schedule for periodic indexing with recoll..."))

(define (recoll-job configuration)
  (match-record configuration <recoll-mcron-configuration>
                (package schedule)
    (let ((recoll-indexer (program-file
                   "recollindex-home-mcron"
                   #~(begin
                       (execl #$(file-append package "/bin/recollindex")
                              "recollindex")))))
      (list #~(job #$schedule #$recoll-indexer)))))

(define recoll-mcron-service-type
  (service-type
   (name 'recoll-mcron-service)
   (extensions
    (list (service-extension home-mcron-service-type
                             recoll-job)))
   (description "Periodic Indexing of files for Recoll File Searching")
   (default-value (recoll-mcron-configuration))))
