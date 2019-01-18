;;; init-haskell --- Haskell Mode Configurations
;;; Commentary:
;;; Code:

(defvar haskell-mode)
(defvar flycheck)
(defvar flycheck-haskell)
(defvar intero-mode-map)
(defvar hindent)

(use-package hindent
  :defer t)

(use-package haskell-mode
  :after (hindent flycheck)
  :hook ((haskell-mode-hook . eldoc-mode))
  :bind (:map interactive-haskell-mode-map
              ("M-N" . haskell-goto-next-error)
              ("M-P" . haskell-goto-prev-error)
              :map haskell-mode-map
              ("C-c h" . hoogle)
              ("C-o" . open-line))
  :init
  (setq-default haskell-stylish-on-save t))

(use-package flycheck-haskell
  :after (haskell-mode flycheck))

(provide 'init-haskell)
;;; init-haskell.el ends here
