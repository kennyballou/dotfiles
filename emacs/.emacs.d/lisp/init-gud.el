;;; init-gud --- gud setup and configuration
;;; Commentary:
;;; Code:

(defvar realgud)

(use-package realgud)

(use-package realgud-jdb
  :after realgud)

(provide 'init-gud)
;;; init-gud.el ends here
