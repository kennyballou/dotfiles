;;; init-grep --- grep/search configuration
;;; Commentary:
;;; Code:

(defvar ag)
(defvar wgrep-ag)

(setq-default grep-highlight-matches t
              grep-scroll-output t)

(use-package ag)

(when (and (executable-find "ag")
           (require 'ag))
  (use-package wgrep-ag)
  (setq-default ag-highlight-search t))

(provide 'init-grep)
;;; init-grep.el ends here
