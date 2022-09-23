(define-module (kbg services emacs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (gnu home-services emacs)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-xyz)
  #:use-module ((gnu packages emacs-xyz) #:prefix emacs-xyz:)
  #:use-module (emacs packages melpa)
  #:use-module (kbg packages emacs-xyz))

(define rewrite
  (package-input-rewriting
   `((,emacs-xyz:emacs-async . ,emacs-async)
     (,emacs-xyz:emacs-cider . ,emacs-cider)
     (,emacs-xyz:emacs-dash . ,emacs-dash)
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
        emacs-auctex
        emacs-auctex-latexmk
        emacs-autodisass-java-bytecode
        emacs-avy
        emacs-bash-completion
        ;; emacs-bbdb
        ;; emacs-bbdb-vcard
        ;; emacs-bind-key
        emacs-bibtex-to-plain-text
        emacs-bnf-mode
        emacs-browse-kill-ring
        emacs-buffer-move
        ;; emacs-bundler
        emacs-cider
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
        emacs-coverlay
        ;; emacs-css-eldoc
        emacs-csv-mode
        emacs-d-mode
        emacs-dap-mode
        emacs-dash
        emacs-debbugs
        emacs-define-word
        emacs-delight
        emacs-diff-hl
        emacs-diminish
        emacs-direnv
        emacs-disable-mouse
        ;; emacs-djvu
        ;; emacs-djvu3
        emacs-docker
        emacs-docker-compose-mode
        emacs-docker-tramp
        emacs-dockerfile-mode
        emacs-ebdb
        emacs-editorconfig
        ;; emacs-edts
        emacs-ein
        emacs-elein
        emacs-elfeed
        emacs-elfeed-org
        emacs-elgantt
        emacs-elixir-mode
        emacs-elm-mode
        emacs-emms
        emacs-envrc
        emacs-epkg
        ;; emacs-erlang
        emacs-eshell-syntax-highlighting
        ;; emacs-eshell-vterm
        emacs-ess
        emacs-exec-path-from-shell
        emacs-expand-region
        emacs-f
        ;; emacs-fetchmail
        emacs-flycheck
        emacs-flycheck
        emacs-flycheck-clojure
        emacs-flycheck-color-mode-line
        ;; emacs-flycheck-credo
        ;; emacs-flycheck-elixir
        emacs-flycheck-elm
        emacs-flycheck-haskell
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
        emacs-forge
        emacs-fullframe
        ;; emacs-geben
        ;; emacs-geben-helm-projectile
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
        ;; emacs-helm-bbdb
        emacs-helm-bibtex
        emacs-helm-descbinds
        emacs-helm-flycheck
        ;; emacs-helm-flyspell
        emacs-helm-gtags
        emacs-helm-lsp
        ;; emacs-helm-mu
        emacs-helm-pass
        emacs-helm-projectile
        ;; emacs-helm-rg
        ;; emacs-helm-sql-connect
        ;; emacs-helm-tramp
        ;; emacs-helm-wordnet
        ;; emacs-helm-xref
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
        emacs-inf-ruby
        emacs-ivy
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
        emacs-lsp-java
        emacs-lsp-mode
        emacs-lsp-python-ms
        emacs-lsp-ui
        emacs-lua-mode
        emacs-magit
        emacs-marginalia
        emacs-markdown-mode
        emacs-mbsync
        emacs-mmm-mode
        emacs-modus-themes
        emacs-mpdel
        emacs-multiple-cursors
        emacs-mwim
        emacs-native-complete
        emacs-nix-mode
        ;; emacs-ob-ipython
        emacs-olivetti
        emacs-orderless
        emacs-org
        emacs-orgalist
        emacs-org-brain
        ;; emacs-org-babel-eval-in-repl
        ;; emacs-org-cliplink
        emacs-org-contacts
        emacs-org-contrib
        emacs-org-dblock-gantt
        emacs-org-gcal
        emacs-org-mime
        emacs-org-pandoc-import
        emacs-org-pomodoro
        emacs-org-ql
        emacs-org-ref
        emacs-org-roam
        emacs-org-roam-ui
        emacs-ox-gfm
        emacs-page-break-lines
        emacs-pass
        emacs-password-store
        emacs-password-store-otp
        emacs-pcmpl-args
        emacs-pcmpl-git
        emacs-pcmpl-pip
        emacs-pcomplete-extension
        emacs-xyz:emacs-pdf-tools
        emacs-peep-dired
        emacs-persp-projectile
        emacs-perspective
        emacs-php-mode
        emacs-pinentry
        emacs-pip-requirements
        emacs-polymode
        emacs-powerline
        emacs-projectile
        emacs-proof-general
        emacs-pulsar
        emacs-racer
        emacs-rainbow-mode
        emacs-rainbow-delimiters
        emacs-realgud
        ;; emacs-realgud-jdb
        emacs-reformatter
        emacs-regex-tool
        emacs-repl-toggle
        emacs-robe
        ;; emacs-rspec-mode
        ;; emacs-ruby-compilation
        ;; emacs-ruby-hash-syntax
        emacs-rust-mode
        ;; emacs-sass-mode
        ;; emacs-scss-mode
        ;; emacs-session
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
        emacs-spinner
        emacs-swiper
        ;; emacs-swiper-helm
        emacs-switch-window
        emacs-synosaurus
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
        ;; emacs-wgrep-ag
        emacs-whitespace-cleanup-mode
        emacs-whole-line-or-region
        emacs-with-editor
        emacs-xref-js2
        emacs-yasnippet
        emacs-z3-mode
        emacs-zeal-at-point
        emacs-zenburn-theme)))

(define (emacs-file fname)
  (string-append ".config/emacs/" fname))

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
                          (,(emacs-file "site-lisp")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/site-lisp")
                                        #:recursive? #t))
                          (,(emacs-file "lsp-java")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/lsp-java")
                                        #:recursive? #t))
                          (,(emacs-file "snippets")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/snippets")
                                        #:recursive? #t))
                          (,(emacs-file "schemas.xml")
                           ,(local-file (string-append %dotfiles-root "config/emacs/emacs.d/schemas.xml")))))
        (service home-emacs-service-type
                 (home-emacs-configuration
                  (package emacs-next-pgtk)
                  (rebuild-elisp-packages? #t)
                  (server-mode? #t)
                  (elisp-packages emacs-packages)))))
