;;; init-tramp --- General TRAMP configurations
;;; Commentary:
;;; Code:

(defvar counsel)
(defvar counsel-tramp)

(use-package counsel-tramp
  :after counsel)

(define-key global-map (kbd "C-c s") #'counsel-tramp)

(provide 'init-tramp)
;;; init-tramp.el ends here
