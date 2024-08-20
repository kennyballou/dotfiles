;;; init-xref --- xref configuration and setup
;;; Commentary:
;;; Code:

(defvar gxref)

(use-package gxref
  :config
  (add-to-list 'xref-backend-functions 'gxref-xref-backend))

(provide 'init-xref)
;;; init-xref.el ends here
