;;; init-projectile --- setup and configuration for projectile
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  (defvar guide-key/guide-key-sequence)
  ;; The following code means you get a menu if you hit "C-c p" and wait
  (with-eval-after-load 'guide-key
    (add-to-list 'guide-key/guide-key-sequence "C-c p"))

  ;; Shorter modeline
  (with-eval-after-load 'projectile
    (setq-default
     projectile-mode-line
     '(:eval
       (if (file-remote-p default-directory)
           " Proj"
         (format " Proj[%s]" (projectile-project-name)))))))

(provide 'init-projectile)
;;; init-projectile.el ends here
