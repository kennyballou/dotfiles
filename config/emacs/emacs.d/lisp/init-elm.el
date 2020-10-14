;;; init-elm --- Elm Mode Configuration
;;; Commentary:
;;; Code:

(defvar flycheck)
(defvar flycheck-elm)
(defvar elm-mode)
(defvar elm-reactor-arguments)
(defvar melpa-unstable)

(use-package flycheck-elm
  :after flycheck)

(use-package elm-mode
  :after (flycheck flycheck-elm)
  :defer t
  :diminish
  :config
  (flycheck-elm-setup)
  (when (executable-find "elm-oracle")
    (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))
  (when (executable-find "elm-format")
    (setq-default elm-format-on-save t))
  (setq elm-reactor-arguments nil)
  (diminish 'elm-indent-mode))

(provide 'init-elm)
;;; init-elm.el ends here
