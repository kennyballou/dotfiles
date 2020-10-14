;;; init-elixir --- elixir configuration and setup
;;; Commentary:
;;; Code:

(defvar lsp-mode)
(defvar elixir-mode)
(defvar alchemist)
(defvar flycheck-credo)
(defvar flycheck-elixir)

(use-package alchemist
  :diminish
  :config
  (diminish 'alchemist-phoenix-mode))

(use-package elixir-mode
  :after lsp-mode
  :init
  (defun kb/elixir-mode ()
    (lsp-mode)
    (lsp-deferred))
  :hook (elixir-mode . kb/elixir-mode))

(use-package flycheck-credo
  :defer t
  :after elixir-mode
  :hook (elixir-mode . flycheck-credo-setup))
(use-package flycheck-elixir
  :defer t
  :after elixir-mode)

(provide 'init-elixir)
;;; init-elixir.el ends here
