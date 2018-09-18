;;; init-elm --- Elm Mode Configuration
;;; Commentary:
;;; Code:

(defvar flycheck)
(defvar flycheck-elm)
(defvar elm-mode)
(defvar melpa-unstable)

(use-package flycheck-elm
  :pin melpa-unstable
  :after flycheck)

(use-package elm-mode
  :after (flycheck flycheck-elm)
  :pin melpa-unstable
  :defer t
  :diminish
  :init
  (setq-default elm-format-on-save t)
  :config
  (flycheck-elm-setup)
  (when (executable-find "elm-oracle")
    (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))
  (when (executable-find "elm-format")
    (setq-default elm-format-on-save t)))

(provide 'init-elm)
;;; init-elm.el ends here
