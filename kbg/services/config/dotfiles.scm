(define-module (kbg services config dotfiles)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (kbg services config aspell)
  #:use-module (kbg services config chktex)
  #:use-module (kbg services config direnv)
  #:use-module (kbg services config email)
  #:use-module (kbg services config fontconfig)
  #:use-module (kbg services config git)
  #:use-module (kbg services config global)
  #:use-module (kbg services config gnupg)
  #:use-module (kbg services config gnuplot)
  #:use-module (kbg services config guix)
  #:use-module (kbg services config guile)
  #:use-module (kbg services config haskell)
  #:use-module (kbg services config kitty)
  #:use-module (kbg services config languagetool)
  #:use-module (kbg services config ledger)
  #:use-module (kbg services config maven)
  #:use-module (kbg services config mpd)
  #:use-module (kbg services config nixpkgs)
  #:use-module (kbg services config nyxt)
  #:use-module (kbg services config parallel)
  #:use-module (kbg services config pdfpc)
  #:use-module (kbg services config ssh)
  #:use-module (kbg services config tmux)
  #:use-module (kbg services config vale)
  #:use-module (kbg services config vars)
  #:use-module (kbg services config wallpaper)
  #:use-module (kbg services config xdg)
  #:export (configs-for-host))

(define axo-configs
  (append aspell-config-service
          chktex-config-service
          direnv-config-service
          email-config-service
          font-config-service
          git-config-service
          global-config-service
          gnupg-config-service
          gnuplot-config-service
          guix-config-service
          guile-config-service
          haskell-config-service
          home-vars-service
          kitty-config-service
          languagetool-systemd
          ledger-config-service
          maven-config-service
          mpd-config-service
          nixpkgs-config-service
          nyxt-config-service
          parallel-config-service
          pdfpc-config-service
          ssh-config-service
          tmux-config-service
          vale-config-service
          wallpaper-config-service
          xdg-config-service))

(define yak-configs
  (append direnv-config-service
          git-config-service
          gnuplot-config-service
          guix-config-service
          home-vars-service
          nixpkgs-config-service
          parallel-config-service
          ssh-config-service
          tmux-config-service
          xdg-config-service))

(define owl-configs
  (append direnv-config-service
          git-config-service
          gnupg-config-service
          gnuplot-config-service
          guix-config-service
          home-vars-service
          nixpkgs-config-service
          parallel-config-service
          ssh-config-service
          tmux-config-service))

(define koi-configs
  (append direnv-config-service
          email-config-service
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
          nyxt-config-service
          parallel-config-service
          ssh-config-service
          tmux-config-service
          vale-config-service
          xdg-config-service))

(define bard-configs
  (append guix-config-service
          tmux-config-service))

(define (configs-for-host hostname)
  (cond ((eq? hostname 'axo)
         axo-configs)
        ((eq? hostname 'yak)
         yak-configs)
        ((eq? hostname 'koi)
         koi-configs)
        ((eq? hostname 'owl)
         owl-configs)
        ((eq? hostname 'bard)
         bard-configs)
        (else '())))
