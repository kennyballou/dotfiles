;;; init-tex --- LaTeX Configuration
;;; Commentary:
;;; Code:

(defvar tex)
(defvar auctex)
(defvar TeX-parse-self)
(defvar TeX-auto-save)
(defvar TeX-PDF-mode)
(defvar TeX-save-query)
(defvar reftex-plug-into-AUCTeX)

(use-package reftex
  :commands turn-on-reftex
  :config
  (setq reftex-plug-into-AUCTeX t))

(use-package latex
  :mode
  ("\\.tex\\'" . latex-mode)
  :hook ((TeX-mode-hook . LaTeX-math-mode)
         (TeX-mode-hook . latex-extra-mode)
         (TeX-mode-hook . turn-on-reftex))
  :config
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-save-query nil)
  (setq TeX-PDF-mode t)
  (setq LaTeX-eqnarray-label "eq")
  (setq LaTeX-equation-label "eq")
  (setq LaTeX-figure-label "fig")
  (setq LaTeX-table-label "tab")
  (setq LaTeX-myChapter-label "chap")
  (setq TeX-newline-function #'reindent-then-newline-and-indent)
  (setq LaTeX-section-hook '(LaTeX-section-heading
                             LaTeX-section-title
                             LaTeX-section-toc
                             LaTeX-section-section
                             LaTeX-section-label))
  (setq TeX-source-correlate-method 'synctex)
  (setq TeX-source-correlate-start-server t)
  (setq-default TeX-master nil))

(use-package tex-site
  :after tex
  :config
  (setq reftex-enable-partial-scans t)
  (setq reftex-save-parse-info t)
  (setq reftex-use-multiple-selection-buffers t)
  (setq reftex-plug-into-AUCTeX t)
  (setq bibtex-entry-format '(opts-or-alts required-fields numerical-fields realign braces))
  (setq bibtex-align-at-equal-sign t))

(use-package helm-bibtex
  :after tex-site)

(provide 'init-tex)
;;; init-tex.el ends here
