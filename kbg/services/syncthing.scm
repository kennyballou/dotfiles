(define-module (kbg services syncthing)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services syncthing)
  #:use-module (gnu packages syncthing)
  #:use-module (system repl server)
  #:export (syncthing-service))

(define syncthing-service
  (let* ((syncthing (shepherd-service
                     (provision '(syncthing))
                     (requirement '())
                     (documentation "Run and Control syncthing.")
                     (start #~(make-forkexec-constructor
                               (list #$(file-append syncthing "/bin/syncthing"))))
                     (stop #~(make-kill-destructor)))))
    (list syncthing)))
