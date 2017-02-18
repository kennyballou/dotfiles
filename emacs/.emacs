(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)

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
(setq require-final-newline nil)

;;line numbers
(global-linum-mode t)

;;whitespace
(setq-default indicate-empty-lines t)

(require 'whitespace)

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

;;iy-go-to-char
(require 'iy-go-to-char)

(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)

;;disable mouse
(require 'disable-mouse)
(global-disable-mouse-mode)

;;delighted mode
(require 'delight)
(delight 'disable-mouse)

;;hooks
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)