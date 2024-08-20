;;; init-epa --- EPA Configuration
;;; Commentary:
;;; Code:

(defvar pinentry)
(defvar epa-pinentry-mode)

(use-package pinentry
  :config
  (setq epa-pinentry-mode 'loopback)
  (pinentry-start))



(provide 'init-epa)
;;; init-epa.el ends here
