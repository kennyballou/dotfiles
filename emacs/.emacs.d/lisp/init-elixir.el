;;; init-elixir --- elixir configuration and setup
;;; Commentary:
;;; Code:

(defvar elixir-mode)
(defvar alchemist)
(defvar flycheck-credo)
(defvar flycheck-elixir)

(use-package alchemist
  :diminish
  :config
  (diminish 'alchemist-phoenix-mode))
(use-package elixir-mode)

(use-package flycheck-credo
  :defer t
  :after elixir-mode
  :hook (elixir-mode . flycheck-credo-setup))
(use-package flycheck-elixir
  :defer t
  :after elixir-mode)

;; (add-hook 'elixir-mode-hook 'flycheck-credo-setup)

(provide 'init-elixir)
;;; init-elixir.el ends here
