(define-module (kbg services borg)
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
  #:export (borg-backup-job
            borg-break-lock-job
            borg-prune-job))

(define borg-backup-job
  #~(#$(file-append borg "/bin/borg")
     "create"
     "--verbose"
     "--stats"
     "--progress"
     "--show-rc"
     "--compression" "lz4"
     "--exclude-caches"
     "--exclude-from" "/home/kb/.config/borg/excludes"
     "--upload-ratelimit" "2048"
     "--remote-path=borg14"
     #$(string-append %borg-repository "::{hostname}-{utcnow}")
     "/home/kb"))

(define borg-break-lock-job
  #~(#$(file-append borg "/bin/borg")
     "break-lock"
     "--verbose"
     "--remote-path=borg14"
     #$%borg-repository))

(define borg-prune-job
  #~(#$(file-append borg "/bin/borg")
     "prune"
     "--stats"
     "--list"
     "--keep-hourly=24"
     "--keep-daily=7"
     "--keep-weekly=4"
     "--keep-monthly=6"
     "--keep-yearly=2"
     "--remote-path=borg14"
     #$%borg-repository))
