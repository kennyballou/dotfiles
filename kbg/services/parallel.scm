(define-module (kbg services parallel)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services audio)
  #:use-module (gnu packages base)
  #:use-module (gnu packages mpd)
  #:use-module (system repl server))

(define-public parallel-mk-temp-dir-service
  (list (shepherd-service
         (documentation "Ensure parallel cache/temporary directory is created ")
         (provision '(parallel-mk-temp-dir))
         (requirement '())
         (one-shot? #t)
         (start #~(make-forkexec-constructor
                   (list #$(file-append coreutils "/bin/mkdir")
                         "-p"
                         (string-append (getenv "XDG_CACHE_HOME")
                                        "/parallel/tmp")))))))
