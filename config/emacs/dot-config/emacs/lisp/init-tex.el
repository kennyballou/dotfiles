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
                                     (output-pdf "okular" "pdf-tools")
                                     (output-html "xdg-open")))
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  (setq TeX-source-correlate-method '((dvi . source-specials)
                                      (pdf . synctex)))
  (setq TeX-source-correlate-start-server t)
  (setq-default TeX-master nil)
  (setq TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  (setq bibtex-dialect 'biblatex)
  :hook ((LaTeX-mode . kb/tex-mode)
         (TeX-mode . kb/tex-mode)))

(use-package helm-bibtex
  :bind ("C-c C-r" . #'helm-bibtex)
  :config
  ;; These values are set in `init-local.el'
  ;; (setq bibtex-completion-bibliography nil)
  ;; (setq bibtex-completion-notes-path nil)
  ;; (setq bibtex-completion-library-path nil)
  (setq bibtex-completion-additional-search-fields '(journal booktitle))
  (setq bibtex-completion-display-formats
        '((article       . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${journal:40}")
          (inbook        . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
          (incollection  . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
          (t             . "${=has-pdf=:1}${=has-note=:1} ${=type=:3} ${year:4} ${author:36} ${title:*}")))
  (setq bibtex-completion-pdf-symbol "⌘")
  (setq bibtex-completion-notes-symbol "✎")
  (setq bibtex-completion-pdf-field nil)
  (setq bibtex-completion-pdf-extension '(".pdf" ".djvu"))
  (setq bibtex-completion-format-citation-functions
        '((org-mode      . bibtex-completion-format-org-link-to-PDF)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default))))

(use-package auctex-latexmk
  :after tex
  :config
  (setq auctex-latexmk-inherit-TeX-PDF-mode t)
  :init
  (auctex-latexmk-setup))

(provide 'init-tex)
;;; init-tex.el ends here
