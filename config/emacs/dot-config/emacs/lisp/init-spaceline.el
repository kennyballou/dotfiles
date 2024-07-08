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
  (spaceline-helm-mode 1)
  (spaceline-emacs-theme)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-mu4e-alert-segment-off))


(provide 'init-spaceline)
;;; init-spaceline.el ends here
