;;; init-golang --- Go Mode Configuration and Setup
;;; Commentary:
;;; Code:

(defvar go-mode)
(defvar go-stacktracer)
(defvar before-save-hook)

(use-package go-mode
  :after (lsp-mode)
  :commands (gofmt-before-save)
  :init
  (defun kb/golang-mode ()
    (setq-local indent-tabs-mode t)
    (setq-local tab-width 4)
    (lsp-mode)
    (lsp-deferred))
  :config
  (add-hook 'before-save-hook #'gofmt-before-save)
  :hook (go-mode . kb/golang-mode))

(use-package go-stacktracer)

(provide 'init-golang)
;;; init-golang.el ends here
