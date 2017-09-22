(require-package 'zenburn-theme)
(require-package 'anti-zenburn-theme)

;; Add toggle between zen and anti-zen

(defun light ()
  "activate anti-zenburn theme."
  (interactive)
  (load-theme 'anti-zenburn t))

(defun dark ()
  "activate zenburn theme."
  (interactive)
  (load-theme 'zenburn t))

(add-hook 'after-init-hook 'dark)

(provide 'init-themes)
