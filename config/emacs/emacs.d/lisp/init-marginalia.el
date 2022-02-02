;;; init-marginalia --- marginalia configuration
;;; Commentary:
;;; Code:

(defvar marginalia)

(use-package marginalia
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))


(provide 'init-marginalia)
;;; init-marginalia.el ends here
