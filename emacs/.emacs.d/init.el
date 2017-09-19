;; -*- lexical-binding: t -*-

;;; This file is bootstraps emacs configuration which is
;;; divided into a number of separate files
;;; based on: https://github.com/purcell/emacs.d/blob/master/init.el

(let ((minver "24.1")
      (when (version< emacs-version minver)
        (error "Emacs is too old, this config requires v%s or higher" minver))))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (package-initialize)
;; (setq custom-file "~/.emacs.d/lisp/custom.el")
;; (load custom-file)
;; (load "~/.emacs.d/lisp/backup-files.el")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; "~/.emacs.d/lisp/")
(require 'init-benchmarking) ;; measure startup time

(defconst *spell-check-support-enabled* t)


;; Adjust Garbage Collection Settings
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-threshold))))

;; Begin Bootstrapping
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
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

;;scroll margin
(require 'smooth-scrolling)
(setq smooth-scrolling-margin 10)

(global-hl-line-mode 1)

;;newlines
(setq require-final-newline t)

;;line numbers
(global-linum-mode t)

(maybe-require-package 'regex-tool)

(require 'server)
(unless (server-running-p)
  (server-start))

;; customize interface configuration
(when (file-exists-p custom-file)
  (load custom-file))

;; Allow optional "init-local"
(require 'init-local nil t)

;; Locales (setting them earlier in this file doesn't work in X)
(require 'init-locales)

(when (maybe-require-package 'uptimes)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))


(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
