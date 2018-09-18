;;; init-regrex --- Regex and RE Builder Configuration
;;; Commentary:
;;; Code:

(defvar regex-tool)
(defvar re-builder)
(defvar reb-mode-map)
(defvar melpa-unstable)

(use-package regex-tool
  :defer t
  :pin melpa-unstable
  :init
  (setq-default regex-tool-backend 'perl))

(use-package re-builder
  :ensure nil
  :defer t
  :bind (:map reb-mode-map
              ;;support a slightly more idomatic quit binding in re-builder
              ("C-c C-k" . reb-quit)))

(provide 'init-regex)
;;; init-regex.el ends here
