(define-module (kbg services emacs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (gnu home services)
  #:use-module (gnu home-services emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages tree-sitter)
  #:use-module ((gnu packages emacs-xyz) #:prefix emacs-xyz:)
  #:use-module (emacs packages melpa)
  #:use-module (kbg packages emacs-xyz)
  #:use-module (kbg packages jdtls)
  #:use-module (kbg packages languagetool))

(define rewrite
  (package-input-rewriting
   `((,emacs-xyz:emacs-async . ,emacs-async)
     (,emacs-xyz:emacs-cider . ,emacs-cider)
     (,emacs-xyz:emacs-dash . ,emacs-dash)
     (,emacs-xyz:emacs-esxml . ,emacs-esxml)
     (,emacs-xyz:emacs-helm . ,emacs-helm)
     (,emacs-xyz:emacs-magit . ,emacs-magit)
     (,emacs-xyz:emacs-tablist . ,emacs-tablist))))

(define emacs-packages
  (map rewrite
       (list
        emacs-add-node-modules-path
        emacs-adoc-mode
        emacs-ag
        ;; emacs-alchemist
        emacs-all-the-icons
        ;; emacs-anaconda-mode
        emacs-anzu
        emacs-awqat
        emacs-async
        emacs-async-status
        emacs-xyz:emacs-auctex
        emacs-auctex-latexmk
        emacs-autodisass-java-bytecode
        emacs-avy
        emacs-bash-completion
        ;; emacs-bind-key
        emacs-bibtex-to-plain-text
        emacs-bnf-mode
        emacs-browse-kill-ring
        emacs-buffer-move
        ;; emacs-bundler
        emacs-calibredb
        emacs-casual
        emacs-cider
        emacs-circadian
        emacs-citar
        emacs-citar-org-roam
        emacs-citeproc
        emacs-citeproc-org
        emacs-cljsbuild-mode
        emacs-clojure-mode
        emacs-coffee-mode
        emacs-company-native-complete
        emacs-company
        emacs-counsel
        emacs-counsel-projectile
        emacs-counsel-tramp
        emacs-cov
        emacs-coverlay
        ;; emacs-css-eldoc
        emacs-xyz:emacs-csv-mode
        emacs-cwl-mode
        emacs-d-mode
        emacs-daemons
        emacs-dap-mode
        emacs-dash
        emacs-xyz:emacs-debbugs
        emacs-define-word
        emacs-deft
        emacs-xyz:emacs-delight
        emacs-xyz:emacs-detached
        emacs-devdocs
        emacs-diff-hl
        emacs-diminish
        emacs-dired-rsync
        emacs-direnv
        emacs-disable-mouse
        ;; emacs-djvu
        ;; emacs-djvu3
        emacs-docker
        emacs-docker-compose-mode
        emacs-dockerfile-mode
        emacs-xyz:emacs-ebdb
        emacs-editorconfig
        ;; emacs-edts
        emacs-xyz:emacs-eglot
        ;; emacs-eglot-java
        emacs-ein
        emacs-elein
        emacs-elfeed
        emacs-elfeed-org
        emacs-elfeed-score
        ;; emacs-elgantt
        emacs-elixir-mode
        emacs-elm-mode
        emacs-emms
        emacs-envrc
        emacs-epkg
        ;; emacs-erlang
        emacs-eshell-fringe-status
        emacs-eshell-syntax-highlighting
        ;; emacs-eshell-vterm
        emacs-ess
        emacs-exec-path-from-shell
        emacs-expand-region
        emacs-f
        ;; emacs-fetchmail
        emacs-flycheck
        emacs-flycheck-aspell
        emacs-flycheck-clojure
        emacs-flycheck-color-mode-line
        ;; emacs-flycheck-credo
        ;; emacs-flycheck-elixir
        emacs-flycheck-elm
        emacs-flycheck-haskell
        emacs-flycheck-languagetool
        emacs-flycheck-ledger
        emacs-flycheck-ocaml
        emacs-flycheck-popup-tip
        ;; emacs-flycheck-pos-tip
        ;; emacs-flycheck-posframe
        emacs-flycheck-rust
        emacs-flycheck-vale
        emacs-flyspell-correct
        emacs-fold-dwim
        emacs-forge
        emacs-fullframe
        ;; emacs-geben
        ;; emacs-geben-helm-projectile
        emacs-gc-stats
        emacs-geiser
        emacs-geiser-guile
        emacs-geiser-racket
        emacs-ggtags
        emacs-git-auto-commit-mode
        emacs-git-commit
        emacs-git-link
        emacs-git-modes
        emacs-git-timemachine
        emacs-gnuplot
        emacs-gnus-alias
        emacs-golden-ratio
        emacs-go-autocomplete
        emacs-go-eldoc
        emacs-go-mode
        emacs-go-stacktracer
        emacs-graphviz-dot-mode
        emacs-guix
        emacs-gxref
        emacs-haml-mode
        emacs-haskell-mode
        emacs-helm
        emacs-helm-bibtex
        emacs-helm-bibtexkey
        emacs-helm-descbinds
        emacs-helm-flycheck
        emacs-helm-flyspell
        emacs-helm-git-grep
        emacs-helm-gtags
        emacs-helm-make
        emacs-helm-mu
        emacs-helm-org
        emacs-helm-org-ql
        emacs-helm-pass
        emacs-helm-proc
        emacs-helm-project
        emacs-helm-shell-history
        emacs-helm-sql-connect
        emacs-helm-tramp
        emacs-helm-tree-sitter
        emacs-helm-unicode
        emacs-helm-wordnet
        emacs-xyz:emacs-helm-wordnut
        emacs-helm-xref
        emacs-helpful
        emacs-hg-histedit
        emacs-hgignore-mode
        emacs-highlight-escape-sequences
        ;; emacs-hindent
        emacs-htmlize
        emacs-hydra
        emacs-ibuffer-vc
        emacs-iedit
        ;; emacs-import-js
        emacs-xyz:emacs-info-plus
        emacs-inf-ruby
        emacs-ivy
        emacs-xyz:emacs-jarchive
        emacs-jedi
        emacs-js-comint
        emacs-js2-mode
        emacs-json-mode
        ;; emacs-language-detection
        emacs-ledger-mode
        ;; emacs-less-css-mode
        emacs-link-hint
        emacs-list-unicode-display
        emacs-literate-calc-mode
        emacs-lsp-haskell
        emacs-lsp-jedi
        emacs-lsp-java
        emacs-lsp-mode
        emacs-lsp-ui
        emacs-lua-mode
        emacs-magit
        emacs-magit-annex
        emacs-xyz:emacs-magit-org-todos-el
        emacs-marginalia
        emacs-markdown-mode
        emacs-mbsync
        emacs-xyz:emacs-memory-usage
        emacs-mmm-mode
        emacs-xyz:emacs-modus-themes
        emacs-mpdel
        emacs-mu4e-marker-icons
        emacs-mu4e-overview
        emacs-mu4e-query-fragments
        emacs-multiple-cursors
        emacs-mwim
        emacs-native-complete
        emacs-nginx-mode
        emacs-nix-mode
        emacs-xyz:emacs-nov-el
        ;; emacs-ob-ipython
        emacs-olivetti
        emacs-orderless
        emacs-xyz:emacs-org
        emacs-xyz:emacs-orgalist
        emacs-ob-async
        emacs-ob-restclient
        emacs-org-brain
        ;; emacs-org-babel-eval-in-repl
        ;; emacs-org-cliplink
        emacs-org-contacts
        emacs-xyz:emacs-org-contrib
        emacs-org-dblock-gantt
        emacs-org-gcal
        emacs-org-inline-pdf
        emacs-org-mime
        emacs-xyz:emacs-org-pandoc-import
        emacs-org-pomodoro
        emacs-org-ql
        emacs-org-ref
        emacs-org-roam
        emacs-org-roam-bibtex
        emacs-org-roam-ui
        emacs-xyz:emacs-org-transclusion
        emacs-org-web-tools
        emacs-ox-gfm
        emacs-page-break-lines
        emacs-pass
        emacs-password-store
        emacs-password-store-otp
        emacs-pcmpl-args
        emacs-pcmpl-pip
        emacs-pcomplete-extension
        emacs-xyz:emacs-pcre2el
        emacs-xyz:emacs-pdf-tools
        emacs-peep-dired
        ;; emacs-persp-projectile
        emacs-perspective
        emacs-php-mode
        emacs-pip-requirements
        emacs-polymode
        emacs-powerline
        ;; emacs-projectile
        emacs-proof-general
        emacs-xyz:emacs-pulsar
        emacs-racer
        emacs-xyz:emacs-rainbow-mode
        emacs-rainbow-delimiters
        ;; emacs-realgud
        ;; emacs-realgud-jdb
        emacs-reformatter
        emacs-regex-tool
        emacs-restclient
        emacs-robe
        ;; emacs-rspec-mode
        ;; emacs-ruby-compilation
        ;; emacs-ruby-hash-syntax
        ;; emacs-rust-mode
        emacs-rustic
        ;; emacs-sass-mode
        ;; emacs-scss-mode
        emacs-shroud
        emacs-shx
        emacs-simple-httpd
        ;; emacs-skewer-less
        emacs-skewer-mode
        emacs-slurm-mode
        emacs-smartparens
        emacs-smex
        emacs-smooth-scrolling
        emacs-spaceline
        emacs-xyz:emacs-spinner
        emacs-swiper
        emacs-swiper-helm
        emacs-switch-window
        emacs-synosaurus
        emacs-tabspaces
        emacs-tagedit
        emacs-toml-mode
        emacs-transmission
        emacs-treemacs
        emacs-tuareg
        emacs-typescript-mode
        emacs-unfill
        emacs-unicode-fonts
        emacs-unicode-whitespace
        emacs-use-package
        emacs-use-package
        ;; emacs-virtualenvwrapper
        emacs-vterm
        emacs-xyz:emacs-vundo
        emacs-wgrep
        emacs-wgrep-ag
        emacs-whitespace-cleanup-mode
        emacs-whole-line-or-region
        emacs-with-editor
        emacs-wordnut
        emacs-xyz:emacs-x509-mode
        emacs-xyz:emacs-xr
        emacs-xref-js2
        emacs-yasnippet
        emacs-z3-mode
        emacs-zeal-at-point
        emacs-zenburn-theme)))

(define (emacs-file fname)
  (string-append ".config/emacs/" fname))

(define tree-sitter-langs
  (directory-union "tree-sitter-union"
                   (list tree-sitter
                         tree-sitter-bash
                         tree-sitter-bibtex
                         tree-sitter-c
                         tree-sitter-clojure
                         tree-sitter-cmake
                         tree-sitter-cpp
                         tree-sitter-css
                         tree-sitter-dockerfile
                         tree-sitter-elixir
                         tree-sitter-elm
                         tree-sitter-go
                         tree-sitter-gomod
                         tree-sitter-haskell
                         tree-sitter-html
                         tree-sitter-java
                         tree-sitter-javascript
                         tree-sitter-json
                         tree-sitter-markdown
                         tree-sitter-markdown-gfm
                         tree-sitter-ocaml
                         tree-sitter-org
                         tree-sitter-python
                         tree-sitter-r
                         tree-sitter-racket
                         tree-sitter-ruby
                         tree-sitter-rust
                         tree-sitter-scheme
                         tree-sitter-typescript)))

(define-public emacs-service
  (list (simple-service 'emacs-config
                        home-files-service-type
                        `((,(emacs-file "early-init.el")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/early-init.el")))
                          (,(emacs-file "init.el")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/init.el")))
                          (".gnus.el"
                           ,(if (file-exists? (string-append %dotfiles-root "config/emacs/emacs.d/gnus.el"))
                                (local-file (string-append %dotfiles-root "config/emacs/emacs.d/gnus.el"))
                                (plain-file "gnus.el" "")))
                          (,(emacs-file "org-captures")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/org-captures")
                                        #:recursive? #t))
                          (,(emacs-file "org-roam-templates")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/org-roam-templates")
                                        #:recursive? #t))
                          (,(emacs-file "site-lisp")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/site-lisp")
                                        #:recursive? #t))
                          (,(emacs-file "lsp-java")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/lsp-java")
                                        #:recursive? #t))
                          (,(emacs-file "language-tool") ,languagetool)
                          (,(emacs-file "share/eclipse.jdt.ls") ,jdtls)
                          (,(emacs-file "share/junit-platform-console-standalone.jar")
                           ,(file-append java-junit-platform-console-standalone "/junit-platform-console-standalone-1.10.0.jar"))
                          (,(emacs-file "snippets")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/snippets")
                                        #:recursive? #t))
                          (,(emacs-file "transient/levels.el")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/transient/levels.el")))
                          (,(emacs-file "schemas.xml")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/schemas.xml")))
                          (,(emacs-file "tree-sitter") ,(file-append tree-sitter-langs "/lib/tree-sitter/"))))
        (service home-emacs-service-type
                 (home-emacs-configuration
                  (package emacs-next-pgtk)
                  (rebuild-elisp-packages? #t)
                  (server-mode? #t)
                  (elisp-packages emacs-packages)))))
