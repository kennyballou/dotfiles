(define-module (kbg services config gnupg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu home services))

(define gpg-agent-config
  (mixed-text-file "gpg-agent.conf"
                   "enable-ssh-support\n"
                   "pinentry-program " pinentry-gnome3 "/bin/pinentry-gnome3\n"
                   "default-cache-ttl 28800\n"
                   "max-cache-ttl 43200\n"
                   "allow-emacs-pinentry\n"
                   "allow-loopback-pinentry\n"))

(define-public gnupg-config-service
  (list (simple-service 'gnupg-config
                        home-files-service-type
                        `((".gnupg/gpg.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/gpg.conf")))
                          (".gnupg/gpg-agent.conf"
                           ,gpg-agent-config)
                          (".gnupg/scdaemon.conf"
                           ,(local-file (string-append %dotfiles-root "config/gnupg/scdaemon.conf")))))))
