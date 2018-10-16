;;; init-spaceline --- modeline configuration and setup
;;; Commentary:
;;; Code:

(defvar spaceline)
(defvar spaceline-config)

(use-package spaceline)

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-emacs-theme))


(provide 'init-spaceline)
;;; init-spaceline.el ends here
