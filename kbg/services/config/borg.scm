(define-module (kbg services config borg)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public borg-config-service
  (list (simple-service 'borg-config
                        home-files-service-type
                        `((".config/borg/excludes"
                           ,(local-file (string-append %dotfiles-root "config/borg/dot-config/borg/excludes")))))))
