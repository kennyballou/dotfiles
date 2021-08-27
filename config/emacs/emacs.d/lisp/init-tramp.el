;;; init-tramp --- General TRAMP configurations
;;; Commentary:
;;; Code:

(defvar helm)
(defvar helm-tramp)
(defvar tramp-default-method)
(defvar tramp-terminal-type)
(defvar tramp-verbose)

(use-package helm-tramp
  :after helm)

(define-key global-map (kbd "C-c s") #'helm-tramp)

(setq tramp-default-method "ssh")
(setq tramp-verbose 1)

(add-hook 'helm-tramp-pre-command-hook #'(lambda ()
                                           (projectile-mode 0)
                                           (editorconfig-mode 0)))

(add-hook 'helm-tramp-quit-hook #'(lambda ()
                                    (projectile-mode 1)
                                    (editorconfig-mode 1)))

(provide 'init-tramp)
;;; init-tramp.el ends here
