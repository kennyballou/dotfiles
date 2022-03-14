(define-module (kbg services gnupg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu packages gnupg)
  #:export (gnupg-service))

(define gnupg-service
  (let* ((gpg-agent (shepherd-service
                     (documentation "User GPG-Agent Daemon")
                     (provision '(gpg-agent))
                     (requirement '())
                     (start #~(make-system-constructor
                               #$(file-append gnupg "/bin/gpg-agent")
                               "--daemon"
                               "--verbose"
                               "--options" (string-append (getenv "HOME") "/.gnupg/gpg-agent.conf")))
                     (stop #~(make-system-destructor
                              #$(file-append gnupg "/bin/gpg-connect-agent")
                              "killagent"
                              "/bye")))))
    (list gpg-agent)))
