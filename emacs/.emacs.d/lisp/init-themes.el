;;; init-themes --- theme initialization
;;; Commentary:
;;; Code:

(defvar zenburn-theme)
(defvar anti-zenburn-theme)

(use-package anti-zenburn-theme)
(use-package zenburn-theme)

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
