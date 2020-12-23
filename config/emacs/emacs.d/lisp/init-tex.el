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

(use-package tex
  :hook ((TeX-mode-hook . LaTeX-math-mode)
         (TeX-mode-hook . latex-extra-mode)
         (TeX-mode-hook . turn-on-reftex))
  :config
  (setq TeX-parse-self t
        TeX-auto-save t
        TeX-save-query nil
        TeX-PDF-mode t
        LaTeX-eqnarray-label "eq"
        LaTeX-equation-label "eq"
        LaTeX-figure-label "fig"
        LaTeX-table-label "tab"
        LaTeX-myChapter-label "chap"
        TeX-newline-function #'reindent-then-newline-and-indent
        LaTeX-section-hook '(LaTeX-section-heading
                             LaTeX-section-title
                             LaTeX-section-toc
                             LaTeX-section-section
                             LaTeX-section-label)
        TeX-source-correlate-method 'synctex
        TeX-source-correlate-start-server t)
  (setq-default TeX-master nil))

(use-package tex-site
  :after tex
  :config
  (setq reftex-enable-partial-scans t
        reftex-save-parse-info t
        reftex-use-multiple-selection-buffers t
        reftex-plug-into-AUCTeX t
        bibtex-entry-format '(opts-or-alts required-fields numerical-fields realign braces)
        bibtex-align-at-equal-sign t))

(use-package helm-bibtex
  :after tex-site)

(provide 'init-tex)
;;; init-tex.el ends here
