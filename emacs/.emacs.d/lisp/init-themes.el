(require-package 'zenburn-theme)
(require-package 'anti-zenburn-theme)

(setq-default custom-enabled-themes '(zenburn-theme))

(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custome-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

;; Add toggle between zen and anti-zen
(defun light ()
  "activate anti-zenburn theme."
  (interactive)
  (setq custom-enabled-themes '(anti-zenburn-theme))
  (reapply-themes))

(defun dark ()
  "activate zenburn theme."
  (interactive)
  (setq custom-enabled-themes '(zenburn-theme))
  (reapply-themes))

(provide 'init-themes)
