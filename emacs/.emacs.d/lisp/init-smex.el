;;; init-smex --- Use smex to handle M-x
;;; Commentary:
;;; Code:

(defvar smex)

(use-package smex
  :config
  (progn
    ;; change path for ~/.smex-items
    (setq-default smex-save-file
                  (expand-file-name ".smex-items" user-emacs-directory))
    (global-set-key [remap execute-extended-command] 'smex)))

(provide 'init-smex)
;;; init-smex.el ends here
