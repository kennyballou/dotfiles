;;; init-tex --- LaTeX Configuration
;;; Commentary:
;;; Code:

(defvar tex)
(defvar auctex)
(defvar TeX-parse-self)
(defvar TeX-auto-save)
(defvar TeX-PDF-mode)
(defvar reftex-plug-into-AUCTeX)

(use-package tex
  :hook ((TeX-mode-hook . LaTeX-math-mode)
         (TeX-mode-hook . latex-extra-mode)
         (TeX-mode-hook . turn-on-reftex))
  :init
  (setq TeX-parse-self t
        TeX-auto-save t
        TeX-PDF-mode t)
  (setq reftex-plug-into-AUCTeX t))

(provide 'init-tex)
;;; init-tex.el ends here
