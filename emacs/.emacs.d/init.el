;;; init --- Emacs initialization file
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; This file is bootstraps Emacs configuration which is
;;; divided into a number of separate files
;;; based on: https://github.com/purcell/emacs.d/blob/master/init.el
;;; Takes inspiration from https://github.com/jaypei/emacs.d
;;; and many others.
;;; Code:

(let ((minver "24.1"))
  (when (version< emacs-version minver)
    (error "Emacs is too old, this config requires v%s or higher" minver)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-benchmarking) ;; measure startup time

(defconst *spell-check-support-enabled* t)

;; Adjust Garbage Collection Settings
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
    (lambda () (setq gc-cons-threshold (* 20 1024 1024)))))

;; customize interface configuration
(when (file-exists-p custom-file)
  (load custom-file))

;; Begin Bootstrapping
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-use-package)
(require 'init-exec-path)
(require 'init-backupfiles)
(require 'init-env)

;; Allow users to provide an optional "init-preload-local.el"
(require 'init-preload-local nil t)

(use-package wgrep)
(use-package fullframe)

(fullframe list-packages quit-window)

;; Load configs for specific features and modes
(require 'init-themes)
(require 'init-spaceline)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-recentf)
(require 'init-smex)
(require 'init-ido)
(require 'init-ivy)
(require 'init-mwim)
(require 'init-company)
(require 'init-mmm)
(require 'init-editing-utils)
(require 'init-buf-mov)
(require 'init-whitespace)
(require 'init-vc)
(require 'init-git)
(require 'init-projectile)
(require 'init-gud)
(require 'init-compile)
(require 'init-regex)
(require 'init-sessions)
(require 'init-flyspell)
(require 'init-spelling)
(require 'init-misc)
(require 'init-folding)
(unless (version< emacs-version "25.0")
  (require 'init-xref))
(require 'init-flycheck)

;; Shells and Terms
(require 'init-eshell)
(require 'init-term)
(require 'init-pcomplete)

;; Languages and Language Modes
(require 'init-c)
(require 'init-clojure)
(require 'init-clojure-cider)
(require 'init-csv)
(require 'init-css)
(require 'init-docker)
(require 'init-elixir)
(require 'init-elm)
(require 'init-erlang)
(require 'init-golang)
(require 'init-guix)
(require 'init-haskell)
(require 'init-html)
(require 'init-java)
(require 'init-javascript)
(require 'init-markdown)
(require 'init-nix)
(require 'init-nxml)
(require 'init-php)
(require 'init-python)
(require 'init-ruby-mode)
(require 'init-rust)
(require 'init-scala)
(require 'init-scheme)
(require 'init-sql)
(require 'init-tex)
(require 'init-toml)

;; Email and Such
(require 'init-email)
(require 'init-ledger)

(provide 'init)
;;; init.el ends here

;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t
