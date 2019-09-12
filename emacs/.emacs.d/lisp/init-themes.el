;;; init-themes --- theme initialization
;;; Commentary:
;;; Code:

(defvar zenburn-theme)
(defvar anti-zenburn-theme)

(use-package anti-zenburn-theme)
(use-package zenburn-theme)

(setq-default custom-enabled-themes '(zenburn))

;; ensure that themes will be applied even if they have not been customized.
;; https://github.com/purcell/emacs.d/blob/master/lisp/init-themes.el
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

;; Add toggle between zen and anti-zen

(defun light ()
  "Activate anti-zenburn theme."
  (interactive)
  (load-theme 'anti-zenburn t)
  (reapply-themes))

(defun dark ()
  "Activate zenburn theme."
  (interactive)
  (load-theme 'zenburn t)
  (reapply-themes))

(defun space-light ()
  "Active spacemacs light theme."
  (interactive)
  (load-theme 'spacemacs-light t)
  (reapply-themes))

(defun space-dark ()
  "Activate spacemacs dark theme."
  (interactive)
  (load-theme 'spacemacs-dark t)
  (reapply-themes))

(add-hook 'after-init-hook 'dark)

(provide 'init-themes)
;;; init-themes.el ends here
