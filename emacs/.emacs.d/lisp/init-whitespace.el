;;; init-whitespace --- whitespace configurations
;;; Commentary:
;;; Code:

(defvar whitespace)
(defvar whitespace-cleanup-mode)
(defvar fill-column-indicator)
(defvar column-marker)
(defvar auto-fill)
(defvar text-mode)

(use-package whitespace
  :diminish
  :delight global-whitespace-mode
  :config
  (global-whitespace-mode t))
(use-package whitespace-cleanup-mode
  :diminish
  :config
  (global-whitespace-cleanup-mode t))
(use-package fill-column-indicator
  :diminish)
;; (use-package column-marker)

(setq-default show-trailing-whitespace t)

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

(setq-default indicate-empty-lines t)

(defvar whitespace-display-mappings)
(setq whitespace-display-mappings
      '(
        (newline-mark ?\n  [8617 ?\n] [?$ ?\n])
        (tab-mark ?\t [8677 ?\t] [92 ?\t])
        ))

(defvar whitespace-style)
(setq whitespace-style
      (quote (face
              trailing
              tab-mark
              newline
              lines-tail)))
(add-hook 'find-file-hook 'whitespace-mode)
(add-hook 'text-mode-hook (lambda ()
                            (set-fill-column 79) (turn-on-auto-fill)))

(diminish 'auto-fill-function)

;; Indent
(setq standard-indent 4)
(setq-default tab-width 4
              indent-tabs-mode nil)

;;newlines
(setq require-final-newline t)

;; fci mode
;; https://www.emacswiki.org/emacs/FillColumnIndicator
(defvar fci-mode)
(customize-set-value 'fci-rule-column 79)
(customize-set-value 'fci-rule-width 5)
(define-globalized-minor-mode global-fci-mode fci-mode
  (lambda ()
    (if (and
         (not (string-match "^\*.*\*$" (buffer-name)))
         (not (string-match "^magit.*$" (buffer-name)))
         (not (eq major-mode 'dired-mode))
         (not (eq major-mode 'term-mode))
         (not (eq major-mode 'multi-term-mode))
         )
        (fci-mode 1))))
(global-fci-mode 1)

(add-hook 'after-change-major-mode-hook 'global-fci-mode)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
