;;; init-vc --- VC configuration
;;; Commentary:
;;; Code:

(defvar diff-hl)

(use-package diff-hl
  :hook ((prog-mode . diff-hl-mode)
         (vc-dir-mode . diff-hl-mode)))

(provide 'init-vc)
;;; init-vc.el ends here
