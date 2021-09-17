;;; init-projectile --- setup and configuration for projectile
;;; Commentary:
;;; Code:

(defvar projectile)
(defvar projectile-switch-project-action)
(defvar projectile-completion-system)
(defvar projectile-enable-caching)
(defvar projectile-globally-ignored-files)
(defvar helm-projectile)

(use-package projectile
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :config

  (setq projectile-switch-project-action 'projectile-dired)
  (setq projectile-enable-caching t)
  (setq projectile-per-project-compilation-buffer t)

  (add-to-list 'projectile-globally-ignored-files "node-modules")

  (defvar guide-key/guide-key-sequence)
  ;; The following code means you get a menu if you hit "C-c p" and wait
  (with-eval-after-load 'guide-key
    (add-to-list 'guide-key/guide-key-sequence "C-c p"))

  ;; Shorter modeline
  (setq-default projectile-mode-line-function
                (lambda ()
                  (if (file-remote-p default-directory)
                      "Projectile"
                    (format " Proj[%s]" (projectile-project-name)))))
  :init
  (add-hook 'after-init-hook (lambda () (projectile-mode))))

(use-package helm-projectile
  :after (projectile helm)
  :config
  (helm-projectile-on))

(provide 'init-projectile)
;;; init-projectile.el ends here
