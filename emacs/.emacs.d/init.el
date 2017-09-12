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

;;rainbow mode
(require 'rainbow-mode)

;;rainbow delimiters
(require 'rainbow-delimiters)

;;scroll margin
(require 'smooth-scrolling)
(setq smooth-scrolling-margin 10)

(global-hl-line-mode 1)

;;indent
(setq standard-indent 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;;newlines
(setq require-final-newline t)

;;line numbers
(global-linum-mode t)

;;whitespace
(setq-default indicate-empty-lines t)

(require 'whitespace)

(global-whitespace-mode t)

(setq show-trailing-whitespace t)

(setq whitespace-display-mapping
      '(
        (newline-mark 10 [60 10])
        (tab-mark 9 [187 9] [92 9])
        ))

(setq
 whitespace-space 'whitespace-space
 whitespace-tab 'whitespace-tab
 whitespace-trailing 'whitespace-trailing
 whitespace-newline 'whitespace-newline
 whitespace-empty 'whitespace-empty
 whitespace-lines-tail 'whitespace-lines-tail)

;;disable mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

;;delighted mode
(require 'delight)
(delight 'disable-mouse)

;;hooks
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;do not display passwords, ever...
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
