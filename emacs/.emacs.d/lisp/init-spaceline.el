;;; init-spaceline --- modeline configuration and setup
;;; Commentary:
;;; Code:

(defvar spaceline)
(defvar spaceline-config)

(use-package spaceline
  :demand t)

(use-package spaceline-config
  :after spaceline
  :demand t
  :config
  (spaceline-emacs-theme))


(provide 'init-spaceline)
;;; init-spaceline.el ends here
