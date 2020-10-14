;;; init-haskell --- Haskell Mode Configurations
;;; Commentary:
;;; Code:

(defvar lsp-haskell)
(defvar lsp-haskell-process-path-hie)
(defvar lsp-haskell-process-args-hie)
(defvar haskell-mode)
(defvar flycheck)
(defvar flycheck-haskell)
(defvar intero-mode-map)

(use-package lsp-haskell
  :config
  (setq lsp-haskell-process-path-hie "ghcide")
  (setq lsp-haskell-process-args-hie '()))

(use-package haskell-mode
  :after (flycheck lsp-haskell)
  :init
  (setq-default haskell-stylish-on-save t)
  (defun kb/haskell-mode ()
    (eldoc-mode)
    (lsp-mode)
    (lsp-deferred))
  :hook (haskell-mode . kb/haskell-mode)
  :bind (:map interactive-haskell-mode-map
              ("M-N" . haskell-goto-next-error)
              ("M-P" . haskell-goto-prev-error)
              :map haskell-mode-map
              ("C-c h" . hoogle)
              ("C-o" . open-line)))

(use-package flycheck-haskell
  :after (haskell-mode flycheck))

(provide 'init-haskell)
;;; init-haskell.el ends here
