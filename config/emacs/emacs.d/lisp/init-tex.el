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
  (setq reftex-plugin-into-AUCTeX t)
  (setq reftex-enable-partial-scans t)
  (setq reftex-save-parse-info t)
  (setq reftex-use-multiple-selection-buffers t)
  (setq bibtex-entry-format '(opts-or-alts required-fields numerical-fields realign braces))
  (setq bibtex-align-at-equal-sign t))

(use-package tex
  :mode ("\\.tex\\'" . LaTeX-mode)
  :init
  (defun kb/tex-mode ()
    "Configure TeX/LaTeX mode settings."
    (turn-on-reftex)
    (LaTeX-math-mode t)
    (reftex-isearch-minor-mode t)
    (setq TeX-PDF-mode t)
    (setq TeX-source-correlate-start-server t))
  :config
  (setq TeX-parse-self t)
  (setq TeX-auto-save t)
  (setq TeX-save-query nil)
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
  (setq TeX-view-program-selection '(((output-dvi has-no-display-manager)
                                      "dvi2tty")
                                     ((output-dvi style-pstricks)
                                      "dvips and gv")
                                     (output-dvi "xdvi")
                                     (output-pdf "Evince" "pdf-tools")
                                     (output-html "xdg-open")))
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  (setq TeX-source-correlate-method '((dvi . source-specials)
                                      (pdf . synctex)))
  (setq TeX-source-correlate-start-server t)
  (setq-default TeX-master nil)
  (setq TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  :hook ((LaTeX-mode . kb/tex-mode)
         (TeX-mode . kb/tex-mode)))

(use-package helm-bibtex)

(provide 'init-tex)
;;; init-tex.el ends here
