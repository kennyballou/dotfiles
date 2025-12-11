(define-module (kbg services config emacs)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix git-download)
  #:use-module (gnu home services)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages tree-sitter)
  #:use-module ((gnu packages emacs-xyz) #:prefix emacs-xyz:)
  #:use-module (kbg packages emacs-xyz)
  #:use-module (kbg packages jdtls)
  #:use-module (kbg packages languagetool))

(define (emacs-file fname)
  (string-append ".config/emacs/" fname))

(define (config-file fname)
  (string-append %dotfiles-root "config/emacs/dot-config/emacs/" fname))

(define tree-sitter-langs
  (directory-union "tree-sitter-union"
                   (list tree-sitter
                         tree-sitter-awk
                         tree-sitter-bash
                         tree-sitter-bibtex
                         tree-sitter-c
                         tree-sitter-clojure
                         tree-sitter-cmake
                         tree-sitter-comment
                         tree-sitter-cpp
                         tree-sitter-csv
                         tree-sitter-css
                         tree-sitter-dockerfile
                         tree-sitter-dot
                         tree-sitter-elixir
                         tree-sitter-elisp
                         tree-sitter-elm
                         tree-sitter-erlang
                         tree-sitter-gitattributes
                         tree-sitter-gitcommit
                         tree-sitter-go
                         tree-sitter-gomod
                         tree-sitter-gosum
                         tree-sitter-haskell
                         tree-sitter-html
                         tree-sitter-ini
                         tree-sitter-java-properties
                         tree-sitter-java
                         tree-sitter-javascript
                         tree-sitter-jsonnet
                         tree-sitter-json
                         tree-sitter-kconfig
                         tree-sitter-latex
                         tree-sitter-lua
                         tree-sitter-markdown
                         tree-sitter-nix
                         tree-sitter-ocaml
                         tree-sitter-org
                         tree-sitter-pem
                         tree-sitter-po
                         tree-sitter-python
                         tree-sitter-python-requirements
                         tree-sitter-r
                         tree-sitter-racket
                         tree-sitter-rst
                         tree-sitter-ruby
                         tree-sitter-rust
                         tree-sitter-scheme
                         tree-sitter-tlaplus
                         tree-sitter-typescript
                         tree-sitter-xml
                         tree-sitter-yaml)))

(define-public emacs-config-service
  (list (simple-service 'emacs-config
                        home-files-service-type
                        `((,(emacs-file "early-init.el")
                           ,(local-file (config-file "early-init.el")))
                          (,(emacs-file "init.el")
                           ,(local-file (config-file "init.el")))
                          (".gnus.el"
                           ,(if (file-exists? (config-file "gnus.el"))
                                (local-file (config-file "gnus.el"))
                                (plain-file "gnus.el" "")))
                          (,(emacs-file "org-captures")
                           ,(local-file (config-file "org-captures")
                                        #:recursive? #t))
                          (,(emacs-file "org-roam-templates")
                           ,(local-file (config-file "org-roam-templates")
                                        #:recursive? #t))
                          (,(emacs-file "site-lisp")
                           ,(local-file (config-file "site-lisp")
                                        #:recursive? #t))
                          (,(emacs-file "lsp-java")
                           ,(local-file (config-file "lsp-java")
                                        #:recursive? #t))
                          (,(emacs-file "language-tool") ,languagetool)
                          (,(emacs-file "share/eclipse.jdt.ls") ,jdtls)
                          (,(emacs-file "share/junit-platform-console-standalone.jar")
                           ,(file-append java-junit-platform-console-standalone "/junit-platform-console-standalone-1.10.0.jar"))
                          (,(emacs-file "snippets")
                           ,(local-file (config-file "snippets")
                                        #:recursive? #t))
                          (,(emacs-file "transient/levels.el")
                           ,(local-file (config-file "transient/levels.el")))
                          (,(emacs-file "schemas.xml")
                           ,(local-file (config-file "schemas.xml")))
                          (,(emacs-file "tree-sitter") ,(file-append tree-sitter-langs "/lib/tree-sitter/"))))))
