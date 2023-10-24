(define-module (kbg services config nixpkgs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:export (nixpkgs-config-service))

(define nixpkgs-config-service
  (list (simple-service 'nixpkgs-config
                        home-files-service-type
                        `((".config/nixpkgs/config.nix"
                          ,(local-file (string-append %dotfiles-root "config/nixpkgs/config.nix")))
                          (".config/nix/nix.conf"
                           ,(local-file (string-append %dotfiles-root "config/nix/nix.conf")))))))
