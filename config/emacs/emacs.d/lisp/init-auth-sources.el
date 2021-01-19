;;; init-auth-sources --- auth-sources configuration and utilities
;;; Commentary:
;;; Code:

(defvar pass)
(defvar helm)
(defvar helm-pass)
(defvar auth-source-pass)

(use-package pass)

(use-package helm-pass
  :after helm)

(use-package auth-source-pass
  :config
  (auth-source-pass-enable))

(provide 'init-auth-sources)
;;; init-auth-sources.el ends here
