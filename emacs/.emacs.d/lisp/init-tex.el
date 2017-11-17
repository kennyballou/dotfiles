;;; init-tex --- LaTeX Configuration
;;; Commentary:
;;; Code:

(use-package tex
  :ensure auctex
  :init
  (setq TeX-parse-self t
        TeX-auto-save t
        TeX-PDF-mode t)
  (add-hook 'TeX-mode-hook 'LaTeX-math-mode)
  (add-hook 'TeX-mode-hook 'latex-extra-mode)
  (add-hook 'TeX-mode-hook 'turn-on-reftex)
  (setq reftex-plug-into-AUCTeX t)
  :config
  )

(provide 'init-tex)
;;; init-tex.el ends here
