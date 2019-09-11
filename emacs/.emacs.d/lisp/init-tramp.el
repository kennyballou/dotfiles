;;; init-tramp --- General TRAMP configurations
;;; Commentary:
;;; Code:

(defvar helm)
(defvar helm-tramp)
(defvar tramp-default-method)
(defvar tramp-terminal-type)

(use-package helm-tramp
  :after helm)

(define-key global-map (kbd "C-c s") #'helm-tramp)

(setq tramp-default-method "ssh")

(provide 'init-tramp)
;;; init-tramp.el ends here
