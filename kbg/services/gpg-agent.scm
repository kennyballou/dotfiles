(define-module (kbg services gpg-agent)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu home services)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu services audio)
  #:use-module (system repl server)
  #:use-module (gnu packages gnupg)
  #:export (gpg-agent-service))

(define gpg-agent-service
  (let* ((gpg-agent (shepherd-service
                     (documentation "User GPG-Agent Daemon")
                     (provision '(gpg-agent))
                     (requirement '())
                     (start #~(make-system-constructor
                               (list #$(file-append gnupg "/bin/gpg-agent")
                                     "--daemon"
                                     "--enable-ssh-support"
                                     "--default-cache-ttl=10800")))
                     (stop #~(make-system-destructor
                              (list #$(file-append gnupg "/bin/gpg-connect-agent")
                                    "killagent"
                                    "/bye"))))))
    (list gpg-agent)))
