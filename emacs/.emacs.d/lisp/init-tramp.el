;;; init-tramp --- General TRAMP configurations
;;; Commentary:
;;; Code:

(defvar counsel)
(defvar counsel-tramp)
(defvar tramp-default-method)
(defvar tramp-terminal-type)

(use-package counsel-tramp
  :after counsel)

(define-key global-map (kbd "C-c s") #'counsel-tramp)

(setq tramp-default-method "ssh")

(provide 'init-tramp)
;;; init-tramp.el ends here
