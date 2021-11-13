;;; init-editing-utils --- misc editing configurations
;;; Commentary:
;;; Code:

(defvar browse-kill-ring)
(defvar autorevert)
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

(use-package autorevert
  :diminish auto-revert-mode
  :demand
  :commands auto-revert-mode
  :init
  (add-hook 'dired-mode-hook #'auto-revert-mode)
  :config
  (global-auto-revert-mode t))

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

(defun kb/enable-line-numbers ()
  "Turn on line number display."
  (setq-local display-line-numbers t))

;; explicitly enable line numbers modes
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'kb/enable-line-numbers))

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
  :commands whole-line-or-region-global-mode
  :config
  (whole-line-or-region-global-mode t))

;; (use-package highlight-escape-sequences
;;   :init
;;   (hes-mode))

(global-hl-line-mode t)

(use-package olivetti
  :config
  (setq olivetti-minimum-body-width 100))

(use-package define-word)

(setq backward-delete-char-untabify-method 'hungry)



(use-package page-break-lines
  :diminish
  :config
  (global-page-break-lines-mode t))



(use-package editorconfig
  :diminish
  :config
  (editorconfig-mode t))



(use-package smartparens
  :diminish)



(use-package auto-highlight-symbol
  :diminish)



(diminish 'abbrev-mode)
(diminish 'eldoc-mode)



(provide 'init-editing-utils)
;;; init-editing-utils.el ends here
