;;; init-gud --- gud setup and configuration
;;; Commentary:
;;; Code:

(defvar gud)
(defvar gud-gdb)

(use-package gud
  :ensure nil
  :commands gud-gdb)

(provide 'init-gud)
;;; init-gud.el ends here
