;;; init-perspective --- setup and configuration for perspective
;;; Commentary:
;;; Code:

(defvar perspective)

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)
  :config
  (setq persp-state-default-file (concat user-emacs-directory "perspective.state"))
  (persp-mode)
  :init
  (add-hook 'kill-emacs-hook #'persp-state-save))

(provide 'init-perspective)
;;; init-perspective.el ends here
