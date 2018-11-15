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
  :pin melpa-unstable
  :defer t
  :after elixir-mode
  :hook (elixir-mode . flycheck-credo-setup))
(use-package flycheck-elixir
  :pin melpa-unstable
  :defer t
  :after elixir-mode)

(provide 'init-elixir)