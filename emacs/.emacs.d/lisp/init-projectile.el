;;; init-projectile --- setup and configuration for projectile
;;; Commentary:
;;; Code:

(require 'ido)

(defvar projectile)
(defvar projectile-switch-project-action)
(defvar projectile-completion-system)
(defvar projectile-enable-caching)
(defvar projectile-globally-ignored-files)

(use-package projectile
  :ensure t
  :init (add-hook 'after-init-hook 'projectile-global-mode)
  :config

  (setq projectile-switch-project-action 'projectile-dired
        projectile-completion-system 'ido
        projectile-enable-caching t)

  (add-to-list 'projectile-globally-ignored-files "node-modules")

  (defvar guide-key/guide-key-sequence)
  ;; The following code means you get a menu if you hit "C-c p" and wait
  (with-eval-after-load 'guide-key
    (add-to-list 'guide-key/guide-key-sequence "C-c p"))

  ;; Shorter modeline
  (setq-default
   projectile-mode-line
   '(:eval
     (if (file-remote-p default-directory)
         " Proj"
       (format " Proj[%s]" (projectile-project-name))))))

(provide 'init-projectile)
;;; init-projectile.el ends here