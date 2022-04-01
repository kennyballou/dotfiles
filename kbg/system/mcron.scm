(define-module (kbg system mcron)
  #:use-module (gnu)
  #:use-module (guix)
  #:export (nix-gc-job
            guix-gc-repair-job
            guix-gc-job))


(define nix-gc-job
  #~(job '(next-hour '(1))
         "nix-collect-garbage --delete-old"
         "nix garbage collection"))

(define guix-gc-repair-job
  #~(job '(next-hour '(0))
         "guix gc --verify=contents,repair"
         "guix store repair"))

(define guix-gc-job
  #~(job "5 0 * * 0"
         "guix gc --collect-garbage"
         "guix garbage collection"))
