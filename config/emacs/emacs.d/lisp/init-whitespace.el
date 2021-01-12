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
  :config
  (global-whitespace-mode t))
(use-package whitespace-cleanup-mode
  :diminish
  :config
  (global-whitespace-cleanup-mode t))

(use-package unicode-whitespace
  :after (whitespace))

;;; Whitespace

(defun sanityinc/show-trailing-whitespace ()
  "Enable display of trailing whiteSpace in this buffer."
  (setq-local show-trailing-whitespace t))

;; Explicitly show trailing whiteSpace in these modes
(dolist (hook '(prog-mode-hook text-mode-hook conf-mode-hook))
  (add-hook hook #'sanityinc/show-trailing-whitespace))

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

;;newlines
(setq require-final-newline t)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
