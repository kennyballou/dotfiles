(define-module (kbg services mpd)
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
  #:use-module (system repl server)
  #:export (mpd-service))

(define mpd-service
  (let* ((mpd-create-socket-dir (shepherd-service
                                 (documentation "Create temporary socket directory for MPD")
                                 (provision '(mpd-create-socket-dir))
                                 (requirement '())
                                 (one-shot? #t)
                                 (start #~(make-forkexec-constructor
                                           (list #$(file-append coreutils "/bin/mkdir")
                                                 "-p"
                                                 "/run/user/1000/mpd")))))
         (mpd (shepherd-service
              (documentation "User MPD daemon")
              (provision '(mpd))
              (requirement '(mpd-create-socket-dir))
              (start #~(make-forkexec-constructor
                        (list #$(file-append mpd "/bin/mpd")
                              "--no-daemon"
                              (string-append (getenv "HOME")
                                             "/.config/mpd/mpd.conf"))))
              (stop #~(make-kill-destructor))
              (actions (list (shepherd-action
                              (name 'update-db)
                              (documentation "Update MPD Database")
                              (procedure #~(lambda (running . args)
                                             (system (string-join (list #$(file-append mpd-mpc "/bin/mpc")
                                                                        "update") " "))))))))))
    (list mpd-create-socket-dir mpd)))
