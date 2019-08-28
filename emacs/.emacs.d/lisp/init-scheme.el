;;; init-scheme --- Scheme Lisp Configuration
;;; Commentary:
;;; Code:

(defvar geiser)
(defvar geiser-active-implementations)

(setq geiser-active-implementations '(guile))

(use-package geiser)

(provide 'init-scheme)
;;; init-scheme.el ends here
