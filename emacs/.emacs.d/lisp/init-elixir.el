;;; init-elixir --- elixir configuration and setup
;;; Commentary:
;;; Code:

;; (defvar elixir-mode)
;; (defvar alchemist)

;; (use-package alchemist
;;   :mode (("\\.ex\\'" . alchemist-mode)
;;          ("\\.exs\\'" . alchemist-mode))
;;   )

;; (use-package elixir-mode
;;   :mode (("\\.ex\\'" . elixir-mode)
;;          ("\\.exs\\'" . elixir-mode))
;;   )

(require-package 'alchemist)
(require-package 'elixir-mode)
(when (maybe-require-package 'flycheck)
  (require-package 'flycheck-credo)
  (require-package 'flycheck-elixir))

(add-hook 'elixir-mode-hook 'flycheck-credo-setup)

(provide 'init-elixir)
;;; init-elixir.el ends here
