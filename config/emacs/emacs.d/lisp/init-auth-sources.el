;;; init-auth-sources --- auth-sources configuration and utilities
;;; Commentary:
;;; Code:

(defvar pass)
(defvar helm)
(defvar helm-pass)

(use-package pass)

(use-package helm-pass
  :after helm)

(provide 'init-auth-sources)
;;; init-auth-sources.el ends here
