;;; init-elixir --- elixir configuration and setup
;;; Commentary:
;;; Code:

(require-package 'alchemist)
(require-package 'elixir-mode)
(when (maybe-require-package 'flycheck)
  (require-package 'flycheck-credo)
  (require-package 'flycheck-elixir))

(add-hook 'elixir-mode-hook 'flycheck-credo-setup)

(provide 'init-elixir)
;;; init-elixir.el ends here
