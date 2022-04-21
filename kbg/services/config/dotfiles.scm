(define-module (kbg services config dotfiles)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (kbg services config direnv)
  #:use-module (kbg services config email)
  #:use-module (kbg services config flatpak)
  #:use-module (kbg services config git)
  #:use-module (kbg services config global)
  #:use-module (kbg services config gnupg)
  #:use-module (kbg services config gnuplot)
  #:use-module (kbg services config guix)
  #:use-module (kbg services config kitty)
  #:use-module (kbg services config ledger)
  #:use-module (kbg services config mpd)
  #:use-module (kbg services config nixpkgs)
  #:use-module (kbg services config parallel)
  #:use-module (kbg services config vale)
  #:use-module (kbg services config vars)
  #:use-module (kbg services config xdg)
  #:export (configs-for-host))

(define daeva-configs
  (append direnv-config-service
          email-config-service
          flatpak-config-service
          git-config-service
          ;; global-config-service
          gnupg-config-service
          gnuplot-config-service
          guix-config-service
          home-vars-service
          kitty-config-service
          ledger-config-service
          mpd-config-service
          nixpkgs-config-service
          parallel-config-service
          vale-config-service
          xdg-config-service))

(define yak-configs
  (append direnv-config-service
          email-config-service
          flatpak-config-service
          git-config-service
          ;; global-config-service
          gnupg-config-service
          gnuplot-config-service
          guix-config-service
          home-vars-service
          kitty-config-service
          mpd-config-service
          nixpkgs-config-service
          parallel-config-service
          vale-config-service
          xdg-config-service))

(define (configs-for-host hostname)
  (cond ((eq? hostname 'daeva)
         daeva-configs)
        ((eq? hostname 'yak)
         yak-configs)
        (else '())))