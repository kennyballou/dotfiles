;;; init-haskell --- Haskell Mode Configurations
;;; Commentary:
;;; Code:

(defvar haskell-mode)
(defvar intero)
(defvar flycheck)
(defvar intero-mode-map)
(defvar hindent)

(use-package hindent
  :defer t)

(use-package intero
  :defer
  :after flycheck
  :config
  (unbind-key (kbd "M-?") intero-mode-map)
  (flycheck-add-next-checker 'intero
                             '(warning . haskell-hlint)))

(use-package haskell-mode
  :after (intero hindent flycheck)
  :hook ((haskell-mode-hook . eldoc-mode))
  :interpreter ("ghci" . haskell-mode)
  :bind (:map interactive-haskell-mode-map
              ("M-N" . haskell-goto-next-error)
              ("M-P" . haskell-goto-prev-error)
              :map haskell-mode-map
              ("C-c h" . hoogle)
              ("C-o" . open-line))
  :init
  (setq-default haskell-stylish-on-save t)
  :config
  (intero-global-mode))

(provide 'init-haskell)
;;; init-haskell.el ends here
