(define-module (kbg packages profiles emacs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (gnu packages emacs)
  #:use-module ((gnu packages coq) #:prefix rocq:)
  #:use-module ((gnu packages finance) #:prefix finance:)
  #:use-module ((gnu packages ocaml) #:prefix ocaml:)
  #:use-module ((gnu packages statistics) #:prefix statistics:)
  #:use-module (guix packages)
  #:use-module (guix transformations)
  #:use-module (guix build-system emacs)
  #:use-module ((gnu packages emacs-build) #:prefix emacs-build:)
  #:use-module ((gnu packages emacs-xyz) #:prefix gnu-emacs:)
  #:use-module ((kbg packages emacs-xyz) #:prefix kbg-emacs:)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 curried-definitions)
  #:export (%kbg-emacs-packages
            kbg-emacs-packages))

(define emacs-rewrite-pkgs
  `(("emacs-async" . ,(const emacs-xyz:emacs-async))
    ("emacs-dash" . ,(const emacs-xyz:emacs-dash))
    ("emacs-f" . ,(const emacs-xyz:emacs-f))
    ("emacs-flycheck" . ,(const emacs-xyz:emacs-flycheck))
    ("emacs-helm" . ,(const emacs-xyz:emacs-helm))
    ("emacs-s" . ,(const emacs-xyz:emacs-s))))

(define (update-emacs-packages pkgs rewrites target-emacs)
  "Recursively rewrite and recompile `pkgs' using `rewrites' and `target-emacs', respectively.

This is wholesale borrowed from @abcdw/rde:
https://git.sr.ht/~abcdw/rde/tree/master/item/src/rde/home/services/emacs.scm"
  (map (package-input-rewriting/spec
            (append
             `(("emacs-minimal" . ,(const target-emacs))
               ("emacs" . ,(const target-emacs))
               ("emacs-no-x" . ,(const target-emacs))
               ("emacs-no-x-toolkit" . ,(const target-emacs))
               ("emacs-wide-int" . ,(const target-emacs)))
             rewrites))
       (let ((elisp-packages pkgs))
         (concatenate
          (cons elisp-packages
                ;; what is this black magic??
                (map (compose (cute map second <>)
                              package-transitive-propagated-inputs)
                     elisp-packages))))))

(define %kbg-emacs-packages
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
   gnu-emacs:emacs-add-node-modules-path
   gnu-emacs:emacs-adoc-mode
   gnu-emacs:emacs-ag
   gnu-emacs:emacs-all-the-icons
   gnu-emacs:emacs-anzu
   gnu-emacs:emacs-async
   gnu-emacs:emacs-auctex
   gnu-emacs:emacs-avy
   gnu-emacs:emacs-bash-completion
   gnu-emacs:emacs-browse-kill-ring
   gnu-emacs:emacs-buffer-move
   gnu-emacs:emacs-calibredb
   gnu-emacs:emacs-casual-dired
   gnu-emacs:emacs-casual-info
   gnu-emacs:emacs-cider
   gnu-emacs:emacs-circadian
   gnu-emacs:emacs-citar
   gnu-emacs:emacs-citar-org-roam
   gnu-emacs:emacs-clojure-mode
   gnu-emacs:emacs-company
   gnu-emacs:emacs-counsel
   gnu-emacs:emacs-counsel-tramp
   gnu-emacs:emacs-cov
   gnu-emacs:emacs-csv-mode
   gnu-emacs:emacs-cwl-mode
   gnu-emacs:emacs-d-mode
   gnu-emacs:emacs-daemons
   gnu-emacs:emacs-dape
   emacs-build:emacs-dash
   gnu-emacs:emacs-debbugs
   gnu-emacs:emacs-deft
   gnu-emacs:emacs-delight
   gnu-emacs:emacs-detached
   gnu-emacs:emacs-devdocs
   gnu-emacs:emacs-diff-hl
   gnu-emacs:emacs-diminish
   gnu-emacs:emacs-dired-rsync
   gnu-emacs:emacs-direnv
   gnu-emacs:emacs-dirvish
   gnu-emacs:emacs-disable-mouse
   gnu-emacs:emacs-docker-compose-mode
   gnu-emacs:emacs-dockerfile-mode
   gnu-emacs:emacs-ebdb
   gnu-emacs:emacs-editorconfig
   gnu-emacs:emacs-ef-themes
   gnu-emacs:emacs-eglot
   gnu-emacs:emacs-elfeed
   gnu-emacs:emacs-elfeed-org
   gnu-emacs:emacs-elfeed-score
   gnu-emacs:emacs-elixir-mode
   gnu-emacs:emacs-elm-mode
   gnu-emacs:emacs-emms
   gnu-emacs:emacs-envrc
   gnu-emacs:emacs-epkg
   gnu-emacs:emacs-eshell-syntax-highlighting
   gnu-emacs:emacs-exec-path-from-shell
   gnu-emacs:emacs-expand-region
   emacs-build:emacs-f
   gnu-emacs:emacs-flycheck
   gnu-emacs:emacs-flycheck-elm
   gnu-emacs:emacs-flycheck-haskell
   gnu-emacs:emacs-flycheck-ledger
   gnu-emacs:emacs-flycheck-rust
   gnu-emacs:emacs-flyspell-correct
   gnu-emacs:emacs-fold-dwim
   gnu-emacs:emacs-fullframe
   gnu-emacs:emacs-gc-stats
   gnu-emacs:emacs-geiser
   gnu-emacs:emacs-geiser-guile
   gnu-emacs:emacs-geiser-racket
   gnu-emacs:emacs-ggtags
   gnu-emacs:emacs-git-auto-commit-mode
   gnu-emacs:emacs-git-link
   gnu-emacs:emacs-git-modes
   gnu-emacs:emacs-git-timemachine
   gnu-emacs:emacs-glsl-mode
   gnu-emacs:emacs-gnuplot
   gnu-emacs:emacs-gnus-alias
   gnu-emacs:emacs-go-mode
   gnu-emacs:emacs-golden-ratio
   gnu-emacs:emacs-graphviz-dot-mode
   gnu-emacs:emacs-guix
   gnu-emacs:emacs-haskell-mode
   gnu-emacs:emacs-helm
   gnu-emacs:emacs-helm-bibtex
   gnu-emacs:emacs-helm-descbinds
   gnu-emacs:emacs-helm-flycheck
   gnu-emacs:emacs-helm-gtags
   gnu-emacs:emacs-helm-make
   gnu-emacs:emacs-helm-org
   gnu-emacs:emacs-helm-org-ql
   gnu-emacs:emacs-helm-pass
   gnu-emacs:emacs-helm-shell-history
   gnu-emacs:emacs-helm-xref
   gnu-emacs:emacs-helpful
   gnu-emacs:emacs-hg-histedit
   gnu-emacs:emacs-hgignore-mode
   gnu-emacs:emacs-highlight-escape-sequences
   gnu-emacs:emacs-htmlize
   gnu-emacs:emacs-hydra
   gnu-emacs:emacs-ibuffer-vc
   gnu-emacs:emacs-iedit
   gnu-emacs:emacs-inf-ruby
   gnu-emacs:emacs-info-plus
   gnu-emacs:emacs-ivy
   gnu-emacs:emacs-jarchive
   gnu-emacs:emacs-jinx
   gnu-emacs:emacs-js-comint
   gnu-emacs:emacs-js2-mode
   gnu-emacs:emacs-json-mode
   gnu-emacs:emacs-jsonnet-mode
   gnu-emacs:emacs-keycast
   gnu-emacs:emacs-link-hint
   gnu-emacs:emacs-literate-calc-mode
   gnu-emacs:emacs-magit
   gnu-emacs:emacs-magit-annex
   gnu-emacs:emacs-markdown-mode
   gnu-emacs:emacs-mbsync
   gnu-emacs:emacs-memory-usage
   gnu-emacs:emacs-mmm-mode
   gnu-emacs:emacs-modus-themes
   gnu-emacs:emacs-mpdel
   gnu-emacs:emacs-multiple-cursors
   gnu-emacs:emacs-mwim
   gnu-emacs:emacs-nginx-mode
   gnu-emacs:emacs-nix-mode
   gnu-emacs:emacs-nov-el
   gnu-emacs:emacs-ob-async
   gnu-emacs:emacs-ob-restclient
   gnu-emacs:emacs-olivetti
   gnu-emacs:emacs-orderless
   gnu-emacs:emacs-org
   gnu-emacs:emacs-org-contacts
   gnu-emacs:emacs-org-contrib
   gnu-emacs:emacs-org-inline-pdf
   gnu-emacs:emacs-org-mime
   gnu-emacs:emacs-org-pandoc-import
   gnu-emacs:emacs-org-pomodoro
   gnu-emacs:emacs-org-ql
   gnu-emacs:emacs-org-ref
   gnu-emacs:emacs-org-roam
   gnu-emacs:emacs-org-roam-bibtex
   gnu-emacs:emacs-org-transclusion
   gnu-emacs:emacs-org-web-tools
   gnu-emacs:emacs-orgalist
   gnu-emacs:emacs-ox-gfm
   gnu-emacs:emacs-page-break-lines
   gnu-emacs:emacs-pass
   gnu-emacs:emacs-password-store
   gnu-emacs:emacs-password-store-otp
   gnu-emacs:emacs-pcmpl-args
   gnu-emacs:emacs-pcre2el
   gnu-emacs:emacs-pdf-tools
   gnu-emacs:emacs-peep-dired
   gnu-emacs:emacs-php-mode
   gnu-emacs:emacs-plantuml-mode
   gnu-emacs:emacs-polymode
   gnu-emacs:emacs-powerline
   gnu-emacs:emacs-pulsar
   gnu-emacs:emacs-racer
   gnu-emacs:emacs-rainbow-delimiters
   gnu-emacs:emacs-rainbow-mode
   gnu-emacs:emacs-reformatter
   gnu-emacs:emacs-restclient
   gnu-emacs:emacs-robe
   gnu-emacs:emacs-rustic
   gnu-emacs:emacs-shx
   gnu-emacs:emacs-simple-httpd
   gnu-emacs:emacs-skewer-mode
   gnu-emacs:emacs-smartparens
   gnu-emacs:emacs-smex
   gnu-emacs:emacs-spinner
   gnu-emacs:emacs-switch-window
   gnu-emacs:emacs-synosaurus
   gnu-emacs:emacs-tagedit
   gnu-emacs:emacs-toml-mode
   gnu-emacs:emacs-treemacs
   gnu-emacs:emacs-typescript-mode
   gnu-emacs:emacs-unfill
   gnu-emacs:emacs-vterm
   gnu-emacs:emacs-vundo
   gnu-emacs:emacs-wgrep
   gnu-emacs:emacs-whitespace-cleanup-mode
   gnu-emacs:emacs-wordnut
   gnu-emacs:emacs-x509-mode
   gnu-emacs:emacs-xr
   gnu-emacs:emacs-yaml-mode
   gnu-emacs:emacs-yasnippet
   finance:emacs-ledger-mode
   kbg-emacs:emacs-awqat
   kbg-emacs:emacs-bibtex-to-plain-text
   kbg-emacs:emacs-org-dblock-gantt
   kbg-emacs:emacs-autodisass-java-bytecode
   kbg-emacs:emacs-bnf-mode
   kbg-emacs:emacs-coverlay
   kbg-emacs:emacs-define-word
   kbg-emacs:emacs-eshell-fringe-status
   kbg-emacs:emacs-flycheck-aspell
   kbg-emacs:emacs-helm-recoll
   kbg-emacs:emacs-helm-sql-connect
   kbg-emacs:emacs-helm-tramp
   kbg-emacs:emacs-helm-unicode
   gnu-emacs:emacs-helm-wordnut
   rocq:proof-general
   kbg-emacs:emacs-regex-tool
   kbg-emacs:emacs-slurm-mode
   kbg-emacs:emacs-whole-line-or-region
   kbg-emacs:emacs-z3-mode
   kbg-emacs:emacs-zeal-at-point
   ocaml:emacs-tuareg
   ))

(define (kbg-emacs-packages target-emacs)
  (append (list target-emacs) (update-emacs-packages %kbg-emacs-packages emacs-rewrite-pkgs target-emacs)))
