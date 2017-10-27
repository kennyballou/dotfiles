(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(setq custom-file "~/.emacs.d/lisp/custom.el")
(load custom-file)
(load "~/.emacs.d/lisp/backup-files.el")

(add-to-list 'load-path "~/.emacs.d/lisp/")

(load-theme 'zenburn t)

;;rainbow mode
(require 'rainbow-mode)

;;rainbow delimiters
(require 'rainbow-delimiters)

;;scroll margin
(require 'smooth-scrolling)
(setq smooth-scrolling-margin 10)

;; no...
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(blink-cursor-mode 0)

;;inhibit splash
(setq inhibit-splash-screen t)

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