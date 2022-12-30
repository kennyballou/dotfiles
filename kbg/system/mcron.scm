(define-module (kbg system mcron)
  #:use-module (gnu)
  #:use-module (gnu packages base)
  #:use-module (guix)
  #:export (nix-gc-job
            guix-gc-repair-job
            guix-gc-job
            updatedb-job))

(define updatedb-job
  ;; Run 'updatedb' at 3AM every day.  Here we write the
  ;; job's action as a Scheme procedure.
  #~(job '(next-hour '(3))
         (lambda ()
           (execl (string-append #$findutils "/bin/updatedb")
                  "updatedb"
                  "--prunepaths=/tmp /var/tmp /gnu/store"))
           "updatedb"))

(define nix-gc-job
  #~(job '(next-hour '(1))
         "nix-collect-garbage --delete-older-than 30d"
         "nix garbage collection"))

(define guix-gc-repair-job
  #~(job '(next-hour '(0))
         "guix gc --verify=contents,repair"
         "guix store repair"))

(define guix-gc-job
  #~(job "5 0 * * 0"
         "guix gc --delete-generations=14d"
         "guix garbage collection"))
