;;; init-vc --- VC configuration
;;; Commentary:
;;; Code:

(when (maybe-require-package 'diff-hl)
  (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'diff-hl-mode))

(provide 'init-vc)
;;; init-vc.el ends here
