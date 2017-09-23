;;; init: --- Emacs initialization file
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; This file is bootstraps Emacs configuration which is
;;; divided into a number of separate files
;;; based on: https://github.com/purcell/emacs.d/blob/master/init.el

;;; Code:


;; (package-initialize)

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

;; Begin Bootstrapping
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-exec-path)

;; Allow users to provide an optional "init-preload-local.el"
(require 'init-preload-local nil t)

(require-package 'wgrep)
(require-package 'diminish)

;; Load configs for specific features and modes
(require 'init-themes)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-recentf)
(require 'init-smex)
(require 'init-ivy)
(require 'init-sessions)
(require 'init-mmm)
(require 'init-editing-utils)
(require 'init-whitespace)
;; (require 'init-vc)
;; (require 'init-git)
;; (require 'init-projectile)
;; (require 'init-compile)
;; (require 'init-textile)
;; (require 'init-markdown)
;; (require 'init-csv)
;; (require 'init-erlang)
;; (require 'init-javascript)
;; (require 'init-php)
;; (require 'init-org)
;; (require 'init-nxml)
;; (require 'init-html)
;; (require 'init-css)
;; (require 'init-haml)
;; (require 'init-python)
;; (unless (version<= emacs-version "24.3")
;;   (require 'init-haskell))
;; (require 'init-elm)
;; (require 'init-ruby-mode)
;; (require 'init-sql)
;; (require 'init-rust)
;; (require 'init-toml)
;; (require 'init-yaml)
;; (require 'init-docker)
;; (require 'init-paredit)
;; (require 'init-lisp)
;; (require 'init-slime)
;; (unless (version<= emacs-version "24.2")
;;   (require 'init-clojure)
;;   (require 'inti-clojure-cider))
;; (require 'init-common-lisp)
;; (require 'init-spelling)
;; (require 'init-misc)
;; (require 'init-folding)
;; (require 'init-ledger)



;; (global-hl-line-mode 1)

;; (maybe-require-package 'regex-tool)

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

;; ;; customize interface configuration
;; (when (file-exists-p custom-file)
;;   (load custom-file))

;; ;; Allow optional "init-local"
;; (require 'init-local nil t)

;; ;; Locales (setting them earlier in this file doesn't work in X)
;; (require 'init-locales)

;; (when (maybe-require-package 'uptimes)
;;   (add-hook 'after-init-hook (lambda () (require 'uptimes))))


(provide 'init)
;;; init.el ends here

;;; Local Variables:
;;; coding: utf-8
;;; no-byte-compile: t

