;;; init-whitespace --- whitespace configurations
;;; Commentary:
;;; Code:

(defvar whitespace)
(defvar whitespace-cleanup-mode)
(defvar unicode-whitespace)
(defvar column-marker)
(defvar auto-fill)
(defvar text-mode)
(defvar default-tab-width)

(use-package whitespace
  :diminish
  :delight global-whitespace-mode
  :config
  (global-whitespace-mode t))
(use-package whitespace-cleanup-mode
  :diminish
  :config
  (global-whitespace-cleanup-mode t))

(setq-default show-trailing-whitespace t)

(use-package unicode-whitespace
  :after (whitespace))

;;; Whitespace

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby, etc
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
  (add-hook hook #'sanityinc/no-trailing-whitespace))

(global-set-key [remap just-one-space] 'cycle-spacing)

(defvar whitespace-display-mappings)
(setq whitespace-display-mappings
      '(
        (newline-mark ?\n  [8617 ?\n] [?$ ?\n])
        (tab-mark ?\t [8677 ?\t] [92 ?\t])
        ))

(defvar whitespace-style)
(setq whitespace-style
      (quote (face
              trailing-mark
              tab-mark
              newline)))

(defun kb/text-mode-setup ()
  "text-mode setup hook."
  (whitespace-mode t)
  (set-fill-column 79)
  (turn-on-auto-fill))

(add-hook 'text-mode-hook #'kb/text-mode-setup)

(diminish 'auto-fill-function)

;; Indent
(setq standard-indent 4)
(setq-default tab-width 4
              default-tab-width 4
              indent-tabs-mode nil)

;;newlines
(setq require-final-newline t)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
