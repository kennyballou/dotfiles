;;; init-pdf-tools --- pdf-tools setup
;;; Commentary:
;;; Code:

(defvar pdf-tools)

(use-package pdf-tools
  :defer t
  :magic ("%PDF" . pdf-view-mdoe)
  :config
  (pdf-tools-install))

(provide 'init-pdf-tools)
;;; init-pdf-tools.el ends here
