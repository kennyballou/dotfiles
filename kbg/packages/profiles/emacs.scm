(define-module (kbg packages profiles emacs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (gnu home services)
  #:use-module (gnu home services emacs)
  #:use-module (gnu packages emacs)
  #:use-module ((gnu packages finance) #:prefix finance:)
  #:use-module ((gnu packages ocaml) #:prefix ocaml:)
  #:use-module (gnu packages tree-sitter)
  #:use-module (guix packages)
  #:use-module (guix build-system emacs)
  #:use-module ((gnu packages emacs-xyz) #:prefix emacs-xyz:)
  #:use-module ((emacs packages melpa) #:prefix melpa:)
  #:use-module ((kbg packages emacs-xyz) #:prefix kbg-emacs:)
  #:use-module (ice-9 curried-definitions)
  #:export (%kbg-emacs-packages))

(define ((update-emacs-argument-for-package target-emacs) p)
  "Set @code{#:emacs} to EMACS-PACKAGE for package P.  To build elisp
packages with proper GNU Emacs version."
  (if (equal?
       (package-build-system p)
       emacs-build-system)
      (package
       (inherit p)
       (arguments
        (susbstitute-keyword-arguments (package-arguments p)
                                       ((#:emacs e #f) target-emacs))))
      p))

(define (recompl target-emacs)
  "Recursively updates @code{#:emacs} argument for package and all the
 inputs."
  (package-mapping (update-emacs-argument-for-package target-emacs)
                   (lambda (p) #f)))

(define rewrite
  (package-input-rewriting
   `((,melpa:emacs-helm . ,emacs-xyz:emacs-helm)
     (,melpa:emacs-flycheck . ,emacs-xyz:emacs-flycheck)
     )))

(define (emacs-packages target-emacs)
  "Return list of Emacs Packages recompiled with TARGET-EMACS."
  (map (recompl target-emacs) %kbg-emacs-packages))

(define packages
  (map rewrite
       (list
        ;; emacs-alchemist
        ;; emacs-anaconda-mode
        ;; emacs-async-status
        ;; emacs-bind-key
        ;; emacs-bundler
        ;; emacs-css-eldoc
        ;; emacs-djvu
        ;; emacs-djvu3
        ;; emacs-edts
        ;; emacs-eglot-java
        ;; emacs-ein
        ;; emacs-elgantt
        ;; emacs-erlang
        ;; emacs-eshell-vterm
        ;; emacs-fetchmail
        ;; emacs-flycheck-credo
        ;; emacs-flycheck-elixir
        ;; emacs-flycheck-pos-tip
        ;; emacs-flycheck-posframe
        ;; emacs-geben
        ;; emacs-geben-helm-projectile
        ;; emacs-gxref
        ;; emacs-hindent
        ;; emacs-import-js
        ;; emacs-language-detection
        ;; emacs-less-css-mode
        ;; emacs-ob-ipython
        ;; emacs-org-babel-eval-in-repl
        ;; emacs-org-cliplink
        ;; emacs-org-gcal
        ;; emacs-persp-projectile
        ;; emacs-projectile
        ;; emacs-realgud
        ;; emacs-realgud-jdb
        ;; emacs-rspec-mode
        ;; emacs-ruby-compilation
        ;; emacs-ruby-hash-syntax
        ;; emacs-rust-mode
        ;; emacs-sass-mode
        ;; emacs-scss-mode
        ;; emacs-skewer-less
        ;; emacs-swiper-helm
        ;; emacs-virtualenvwrapper
        ;; emacs-with-editor
        ;; emacs-xyz:emacs-citeproc
        ;; emacs-xyz:emacs-citeproc-org
        ;; emacs-xyz:emacs-cljsbuild-mode
        ;; emacs-xyz:emacs-coffee-mode
        ;; emacs-xyz:emacs-company-native-complete
        ;; emacs-xyz:emacs-counsel-projectile
        ;; emacs-xyz:emacs-elein
        ;; emacs-xyz:emacs-flycheck-clojure
        ;; emacs-xyz:emacs-flycheck-color-mode-line
        ;; emacs-xyz:emacs-flycheck-languagetool
        ;; emacs-xyz:emacs-flycheck-ocaml
        ;; emacs-xyz:emacs-flycheck-popup-tip
        ;; emacs-xyz:emacs-flycheck-vale
        ;; emacs-xyz:emacs-forge
        ;; emacs-xyz:emacs-go-autocomplete
        ;; emacs-xyz:emacs-go-eldoc
        ;; emacs-xyz:emacs-go-stacktracer
        ;; emacs-xyz:emacs-haml-mode
        ;; emacs-xyz:emacs-helm-flyspell
        ;; emacs-xyz:emacs-helm-git-grep
        ;; emacs-xyz:emacs-helm-mu
        ;; emacs-xyz:emacs-helm-proc
        ;; emacs-xyz:emacs-helm-project
        ;; emacs-xyz:emacs-helm-tree-sitter
        ;; emacs-xyz:emacs-list-unicode-display
        ;; emacs-xyz:emacs-lsp-haskell
        ;; emacs-xyz:emacs-lsp-java
        ;; emacs-xyz:emacs-lsp-jedi
        ;; emacs-xyz:emacs-lsp-mode
        ;; emacs-xyz:emacs-lsp-ui
        ;; emacs-xyz:emacs-magit-org-todos-el
        ;; emacs-xyz:emacs-native-complete
        ;; emacs-xyz:emacs-org-brain
        ;; emacs-xyz:emacs-org-roam-ui
        ;; emacs-xyz:emacs-pcmpl-pip
        ;; emacs-xyz:emacs-pcomplete-extension
        ;; emacs-xyz:emacs-pip-requirements
        ;; emacs-xyz:emacs-shroud
        ;; emacs-xyz:emacs-smooth-scrolling
        ;; emacs-xyz:emacs-swiper
        ;; emacs-xyz:emacs-tabspaces
        ;; emacs-xyz:emacs-unicode-fonts
        ;; emacs-xyz:emacs-unicode-whitespace
        ;; emacs-xyz:emacs-wgrep-ag
        ;; emacs-xyz:emacs-xref-js2
        emacs-xyz:emacs-add-node-modules-path
        emacs-xyz:emacs-adoc-mode
        emacs-xyz:emacs-ag
        emacs-xyz:emacs-all-the-icons
        emacs-xyz:emacs-anzu
        emacs-xyz:emacs-async
        emacs-xyz:emacs-auctex
        emacs-xyz:emacs-avy
        emacs-xyz:emacs-bash-completion
        emacs-xyz:emacs-browse-kill-ring
        emacs-xyz:emacs-buffer-move
        emacs-xyz:emacs-calibredb
        emacs-xyz:emacs-casual-dired
        emacs-xyz:emacs-casual-info
        emacs-xyz:emacs-cider
        emacs-xyz:emacs-circadian
        emacs-xyz:emacs-citar
        emacs-xyz:emacs-citar-org-roam
        emacs-xyz:emacs-clojure-mode
        emacs-xyz:emacs-company
        emacs-xyz:emacs-counsel
        emacs-xyz:emacs-counsel-tramp
        emacs-xyz:emacs-cov
        emacs-xyz:emacs-csv-mode
        emacs-xyz:emacs-cwl-mode
        emacs-xyz:emacs-d-mode
        emacs-xyz:emacs-daemons
        emacs-xyz:emacs-dap-mode
        emacs-xyz:emacs-dape
        emacs-xyz:emacs-dash
        emacs-xyz:emacs-debbugs
        emacs-xyz:emacs-deft
        emacs-xyz:emacs-delight
        emacs-xyz:emacs-detached
        emacs-xyz:emacs-devdocs
        emacs-xyz:emacs-diff-hl
        emacs-xyz:emacs-diminish
        emacs-xyz:emacs-dired-rsync
        emacs-xyz:emacs-direnv
        emacs-xyz:emacs-dirvish
        emacs-xyz:emacs-disable-mouse
        emacs-xyz:emacs-docker
        emacs-xyz:emacs-docker-compose-mode
        emacs-xyz:emacs-dockerfile-mode
        emacs-xyz:emacs-ebdb
        emacs-xyz:emacs-editorconfig
        emacs-xyz:emacs-ef-themes
        emacs-xyz:emacs-eglot
        emacs-xyz:emacs-elfeed
        emacs-xyz:emacs-elfeed-org
        emacs-xyz:emacs-elfeed-score
        emacs-xyz:emacs-elixir-mode
        emacs-xyz:emacs-elm-mode
        emacs-xyz:emacs-emms
        emacs-xyz:emacs-envrc
        emacs-xyz:emacs-epkg
        emacs-xyz:emacs-eshell-syntax-highlighting
        emacs-xyz:emacs-exec-path-from-shell
        emacs-xyz:emacs-expand-region
        emacs-xyz:emacs-f
        emacs-xyz:emacs-flycheck
        emacs-xyz:emacs-flycheck-elm
        emacs-xyz:emacs-flycheck-haskell
        emacs-xyz:emacs-flycheck-ledger
        emacs-xyz:emacs-flycheck-rust
        emacs-xyz:emacs-flyspell-correct
        emacs-xyz:emacs-fold-dwim
        emacs-xyz:emacs-fullframe
        emacs-xyz:emacs-gc-stats
        emacs-xyz:emacs-geiser
        emacs-xyz:emacs-geiser-guile
        emacs-xyz:emacs-geiser-racket
        emacs-xyz:emacs-ggtags
        emacs-xyz:emacs-git-auto-commit-mode
        emacs-xyz:emacs-git-link
        emacs-xyz:emacs-git-modes
        emacs-xyz:emacs-git-timemachine
        emacs-xyz:emacs-glsl-mode
        emacs-xyz:emacs-gnuplot
        emacs-xyz:emacs-gnus-alias
        emacs-xyz:emacs-go-mode
        emacs-xyz:emacs-golden-ratio
        emacs-xyz:emacs-graphviz-dot-mode
        emacs-xyz:emacs-guix
        emacs-xyz:emacs-haskell-mode
        emacs-xyz:emacs-helm
        emacs-xyz:emacs-helm-bibtex
        emacs-xyz:emacs-helm-descbinds
        emacs-xyz:emacs-helm-flycheck
        emacs-xyz:emacs-helm-gtags
        emacs-xyz:emacs-helm-make
        emacs-xyz:emacs-helm-org
        emacs-xyz:emacs-helm-org-ql
        emacs-xyz:emacs-helm-pass
        emacs-xyz:emacs-helm-shell-history
        emacs-xyz:emacs-helm-xref
        emacs-xyz:emacs-helpful
        emacs-xyz:emacs-hg-histedit
        emacs-xyz:emacs-hgignore-mode
        emacs-xyz:emacs-highlight-escape-sequences
        emacs-xyz:emacs-htmlize
        emacs-xyz:emacs-hydra
        emacs-xyz:emacs-ibuffer-vc
        emacs-xyz:emacs-iedit
        emacs-xyz:emacs-inf-ruby
        emacs-xyz:emacs-info-plus
        emacs-xyz:emacs-ivy
        emacs-xyz:emacs-jarchive
        emacs-xyz:emacs-jedi
        emacs-xyz:emacs-jinx
        emacs-xyz:emacs-js-comint
        emacs-xyz:emacs-js2-mode
        emacs-xyz:emacs-json-mode
        emacs-xyz:emacs-jsonnet-mode
        emacs-xyz:emacs-keycast
        emacs-xyz:emacs-link-hint
        emacs-xyz:emacs-literate-calc-mode
        emacs-xyz:emacs-lua-mode
        emacs-xyz:emacs-magit
        emacs-xyz:emacs-magit-annex
        emacs-xyz:emacs-markdown-mode
        emacs-xyz:emacs-mbsync
        emacs-xyz:emacs-memory-usage
        emacs-xyz:emacs-mmm-mode
        emacs-xyz:emacs-modus-themes
        emacs-xyz:emacs-mpdel
        emacs-xyz:emacs-multiple-cursors
        emacs-xyz:emacs-mwim
        emacs-xyz:emacs-nginx-mode
        emacs-xyz:emacs-nix-mode
        emacs-xyz:emacs-nov-el
        emacs-xyz:emacs-ob-async
        emacs-xyz:emacs-ob-restclient
        emacs-xyz:emacs-olivetti
        emacs-xyz:emacs-orderless
        emacs-xyz:emacs-org
        emacs-xyz:emacs-org-contacts
        emacs-xyz:emacs-org-contrib
        emacs-xyz:emacs-org-inline-pdf
        emacs-xyz:emacs-org-mime
        emacs-xyz:emacs-org-pandoc-import
        emacs-xyz:emacs-org-pomodoro
        emacs-xyz:emacs-org-ql
        emacs-xyz:emacs-org-ref
        emacs-xyz:emacs-org-roam
        emacs-xyz:emacs-org-roam-bibtex
        emacs-xyz:emacs-org-transclusion
        emacs-xyz:emacs-org-web-tools
        emacs-xyz:emacs-orgalist
        emacs-xyz:emacs-ox-gfm
        emacs-xyz:emacs-page-break-lines
        emacs-xyz:emacs-pass
        emacs-xyz:emacs-password-store
        emacs-xyz:emacs-password-store-otp
        emacs-xyz:emacs-pcmpl-args
        emacs-xyz:emacs-pcre2el
        emacs-xyz:emacs-pdf-tools
        emacs-xyz:emacs-peep-dired
        emacs-xyz:emacs-php-mode
        emacs-xyz:emacs-plantuml-mode
        emacs-xyz:emacs-polymode
        emacs-xyz:emacs-powerline
        emacs-xyz:emacs-pulsar
        emacs-xyz:emacs-racer
        emacs-xyz:emacs-rainbow-delimiters
        emacs-xyz:emacs-rainbow-mode
        emacs-xyz:emacs-reformatter
        emacs-xyz:emacs-restclient
        emacs-xyz:emacs-robe
        emacs-xyz:emacs-rustic
        emacs-xyz:emacs-shx
        emacs-xyz:emacs-simple-httpd
        emacs-xyz:emacs-skewer-mode
        emacs-xyz:emacs-smartparens
        emacs-xyz:emacs-smex
        emacs-xyz:emacs-spaceline
        emacs-xyz:emacs-spinner
        emacs-xyz:emacs-switch-window
        emacs-xyz:emacs-synosaurus
        emacs-xyz:emacs-tagedit
        emacs-xyz:emacs-toml-mode
        emacs-xyz:emacs-transmission
        emacs-xyz:emacs-treemacs
        emacs-xyz:emacs-typescript-mode
        emacs-xyz:emacs-unfill
        emacs-xyz:emacs-use-package
        emacs-xyz:emacs-vterm
        emacs-xyz:emacs-vundo
        emacs-xyz:emacs-wgrep
        emacs-xyz:emacs-whitespace-cleanup-mode
        emacs-xyz:emacs-wordnut
        emacs-xyz:emacs-x509-mode
        emacs-xyz:emacs-xr
        emacs-xyz:emacs-yaml-mode
        emacs-xyz:emacs-yasnippet
        finance:emacs-ledger-mode
        kbg-emacs:emacs-awqat
        kbg-emacs:emacs-bibtex-to-plain-text
        kbg-emacs:emacs-org-dblock-gantt
        melpa:emacs-autodisass-java-bytecode
        melpa:emacs-bnf-mode
        melpa:emacs-coverlay
        melpa:emacs-define-word
        melpa:emacs-eshell-fringe-status
        melpa:emacs-ess
        melpa:emacs-flycheck-aspell
        melpa:emacs-helm-recoll
        melpa:emacs-helm-sql-connect
        melpa:emacs-helm-tramp
        melpa:emacs-helm-unicode
        melpa:emacs-helm-wordnet
        melpa:emacs-mu4e-marker-icons
        melpa:emacs-mu4e-overview
        melpa:emacs-mu4e-query-fragments
        melpa:emacs-proof-general
        melpa:emacs-regex-tool
        melpa:emacs-slurm-mode
        melpa:emacs-whole-line-or-region
        melpa:emacs-z3-mode
        melpa:emacs-zeal-at-point
        ocaml:emacs-tuareg
        )))

(define %kbg-emacs-packages
  packages)
