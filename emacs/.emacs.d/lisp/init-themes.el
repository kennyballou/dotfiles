;;; init-themes --- theme initialization
;;; Commentary:
;;; Code:

(require-package 'zenburn-theme)
(require-package 'anti-zenburn-theme)

;; Add toggle between zen and anti-zen

(defun light ()
  "Activate anti-zenburn theme."
  (interactive)
  (load-theme 'anti-zenburn t))

(defun dark ()
  "Activate zenburn theme."
  (interactive)
  (load-theme 'zenburn t))

(add-hook 'after-init-hook 'dark)

(provide 'init-themes)
;;; init-themes.el ends here
