;;; init-company --- Company: Complete Anything configuration
;;; Commentary:
;;; Heavily based on
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-company.el
;;; Code:

(defvar company)

(use-package company
  :diminish
  :hook ((prog-mode . company-mode)
         (comint-mode . company-mode))
  :bind (("C-M-/" . company-complete)
         :map company-mode-map
         ("M-/" . company-complete)
         :map company-active-map
         ("M-/" . company-select-next)
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  (defun sanityinc/local-push-company-backend (backend)
    "Add BACKEND to a buffer-local version of `company-backends'."
    (make-local-variable 'company-backends)
    (push backend company-backends))
  )

(provide 'init-company)
;;; init-company.el ends here
