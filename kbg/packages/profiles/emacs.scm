(define-module (kbg packages profiles emacs)
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
  #:export (%kbg-emacs-packages))

(define rewrite
  (package-input-rewriting
   `((,emacs-xyz:emacs-async . ,emacs-async)
     (,emacs-xyz:emacs-cider . ,emacs-cider)
     (,emacs-xyz:emacs-dash . ,emacs-dash)
     (,emacs-xyz:emacs-esxml . ,emacs-esxml)
     (,emacs-xyz:emacs-helm . ,emacs-helm)
     (,emacs-xyz:emacs-magit . ,emacs-magit)
     (,emacs-xyz:emacs-tablist . ,emacs-tablist))))

(define %kbg-emacs-packages
  (map rewrite
       (list emacs-xyz:emacs-auctex)))
