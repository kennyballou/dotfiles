(define-module (kbg services config tmux)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public tmux-config-service
  (list (simple-service 'tmux-config
                        home-files-service-type
                        `((".tmux.conf"
                           ,(local-file (string-append %dotfiles-root "config/tmux/tmux.conf")))))))
