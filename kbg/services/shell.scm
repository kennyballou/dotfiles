(define-module (kbg services shell)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells))

(define-public bash-service
  (list (service home-bash-service-type
                 (home-bash-configuration
                  (guix-defaults? #t)
                  (bash-profile (list (local-file (string-append %dotfiles-root "config/shell/bash_profile"))))
                  (bashrc (list (local-file (string-append %dotfiles-root "config/shell/bashrc"))))))))
