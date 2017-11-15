;;; init-elm --- Elm Mode Configuration
;;; Commentary:
;;; Code:

(when (maybe-require-package 'elm-mode)
  (setq-default elm-format-on-save t)
  (with-eval-after-load 'elm-mode
    (delight 'elm-indent-mode nil 'elm-indent)
    (when (executable-find "elm-oracle")
      (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))
    (when (executable-find "elm-format")
      (setq-default elm-format-on-save t)))
  (when (maybe-require-package 'flycheck-elm)
    (with-eval-after-load 'elm-mode
      (flycheck-elm-setup))))

(provide 'init-elm)
;;; init-elm.el ends here
