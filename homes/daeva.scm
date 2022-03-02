(define-module (homes daeva)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu services audio)
  #:use-module (gnu home services)
  #:use-module (gnu home services fontutils)
  #:use-module (gnu home services mcron)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu home services xdg)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles development)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles fonts)
  #:use-module (kbg packages emacs)
  #:use-module (kbg services config git)
  #:use-module (kbg services config global)
  #:use-module (kbg services config kitty)
  #:use-module (kbg services config ledger)
  #:use-module (kbg services config nixpkgs)
  #:use-module (kbg services config shepherd)
  #:use-module (kbg services config vale)
  #:use-module (kbg services config vars)
  #:use-module (kbg services config xdg)
  #:use-module (kbg services emacs)
  #:use-module (kbg services mcron)
  #:use-module (kbg services mpd)
  #:use-module (kbg services shell))

(home-environment
 (packages
  (append %kbg-base-development-packages
          %kbg-desktop-packages
          %kbg-fonts))

 (services
  (append bash-service
          git-config-service
          ;; global-config-service
          emacs-service
          home-vars-service
          kitty-config-service
          ledger-config-service
          mcron-service
          mpd-service
          nixpkgs-config-service
          shepherd-user-services
          vale-config-service
          xdg-config-service)))
