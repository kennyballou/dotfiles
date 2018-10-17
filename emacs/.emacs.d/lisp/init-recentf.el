;;; init-recentf --- recentf-mode customizations
;;; Commentary:
;;; Code:
(add-hook 'after-init-hook (lambda () (recentf-mode 1)))
(setq-default
 recentf-max-save-items 1000
 recentf-exclude '("/tmp/", "/ssh:"))

(provide 'init-recentf)
;;; init-recentf.el ends here
