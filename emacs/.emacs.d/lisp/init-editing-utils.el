;;; init-editing-utils --- misc editing configurations
;;; Commentary:
;;; Code:

(defvar browse-kill-ring)
(defvar autorevert)
(defvar guide-key)
(defvar auto-revert-mode)
(defvar expand-region)
(defvar er/expand-region)
(defvar guide-key/guide-key-sequence)
(defvar whole-line-or-region)
(defvar whole-line-or-region-local-mode)
(defvar highlight-escape-sequences)
(defvar olivetti)
(defvar olivetti-minimum-body-width)
(defvar define-word)
(defvar nlinum)
(defvar undo-tree)
(defvar avy)
(defvar avy-goto-char-timer)
(defvar multiple-cursors)
(defvar melpa-unstable)
(defvar rainbow-mode)
(defvar rainbow-delimiters)
(defvar whole-line-or-region-global-mode)
(defvar unfill)
(defvar global-auto-revert-non-file-buffers)
(defvar auto-revert-verbose)

(use-package unfill)

(use-package list-unicode-display)

;; Some basic preferences
(setq-default
 blink-cursor-interval 0.4
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(use-package autorevert
  :diminish auto-revert-mode
  :demand
  :commands auto-revert-mode
  :init
  (add-hook 'dired-mode-hook #'auto-revert-mode)
  :config
  (global-auto-revert-mode t))


(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)

;;; A simple visible bell which works in all terminal types
(defun sanityinc/flash-mode-line ()
  "Flash mode line on bell."
  (invert-face 'mode-line)
  (run-with-timer 0.05 nil 'invert-face 'mode-line))

(setq-default
 ring-bell-function 'sanityinc/flash-mode-line)


;;; Newline behaviour
(global-set-key (kbd "RET") 'newline-and-indent)
(defun sanityinc/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "S-<return>") 'sanityinc/newline-at-end-of-line)

(when (eval-when-compile (string< "24.3.1" emacs-version))
  ;; https://github.com/purcell/emacs.d/issues/138
  (with-eval-after-load 'subword
    (delight 'subword-mode nil 'subword)))

(global-display-line-numbers-mode t)

(defun kb/no-line-numbers ()
  "Turn off line numbers for buffers.

Inspired by `sanityinc/no-trailing-whitespace'"
  (display-line-numbers-mode 0))

(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                multi-term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook
                calendar-mode-hook
                eshell-mode-hook))
  (add-hook hook #'kb/no-line-numbers))

(use-package rainbow-mode)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode))

;; Zap *up* to char is a handy pair for zap-to-char
(autoload 'zap-up-to-char "misc" "Kill up to, but not including ARGth occurrence of CHAR.")
(global-set-key (kbd "M-Z") 'zap-up-to-char)


(use-package browse-kill-ring)
(defvar browse-kill-ring-separator)
(defvar browse-kill-ring-mode-map)
(setq browse-kill-ring-separator "\f")
(global-set-key (kbd "M-Y") 'browse-kill-ring)
(with-eval-after-load 'browse-kill-ring
  (define-key browse-kill-ring-mode-map (kbd "C-g") 'browse-kill-ring-quit))


;; Don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

;; Show matching parens
(show-paren-mode 1)

;; Expand region
(use-package expand-region
  :bind (("C-=" . #'er/expand-region)))

;; Don't disable case-change functions
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; Handy key bindings
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(use-package avy
  :commands avy-goto-char-timer
  :bind ("C-;" . #'avy-goto-char-timer))

(use-package multiple-cursors
  :commands (mc/edit-lines mc/edit-ends-of-lines mc/edit-beginnings-of-lines)
  :bind (("C-c m c" . #'mc/edit-lines)
         ("C-c m e" . #'mc/edit-ends-of-lines)
         ("C-c m a" . #'mc/edit-beginnings-of-lines)))

(global-set-key (kbd "C-c m r") 'set-rectangular-region-anchor)

;; Train myself to use M-f and M-b instead
(global-unset-key [M-left])
(global-unset-key [M-right])


;; Fix backward-up-list to understand quotes, see http://bit.ly/h7mdIL
(defun backward-up-sexp (arg)
  "Jump up to the start of the ARG'th enclosing sexp."
  (interactive "p")
  (let ((ppss (syntax-ppss)))
    (cond ((elt ppss 3)
           (goto-char (elt ppss 8))
           (backward-up-sexp (1- arg)))
          ((backward-up-list arg)))))

(global-set-key [remap backward-up-list] 'backward-up-sexp) ; C-M-u, C-M-up


;;----------------------------------------------------------------------------
;; Cut/copy the current line if no region is active
;;----------------------------------------------------------------------------
(use-package whole-line-or-region
  :diminish whole-line-or-region-local-mode
  :defer t
  :commands whole-line-or-region-global-mode
  :config
  (whole-line-or-region-global-mode t))

;; (use-package highlight-escape-sequences
;;   :init
;;   (hes-mode))

(use-package guide-key
  :diminish
  :config
  (setq guide-key/guide-key-sequence '("C-x"
                                       "C-c"
                                       "C-x 4"
                                       "C-x 5"
                                       "C-c ;"
                                       "C-c ; f"
                                       "C-c ' f"
                                       "C-x n"
                                       "C-x C-r"
                                       "C-x r"
                                       "M-s"
                                       "C-h"
                                       "C-c C-a"))
  :hook
  (after-init-hook  . (lambda () (guide-key-mode 1))))

(global-hl-line-mode t)

(use-package olivetti
  :defer t
  :config
  (setq olivetti-minimum-body-width 100))

(use-package define-word
  :defer t)

(setq backward-delete-char-untabify-method 'hungry)

(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
