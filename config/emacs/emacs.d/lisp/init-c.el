;;; init-c --- C/C++ configuration
;;; Commentary:
;;; Code:

(defvar c-default-style)
(setq c-default-style `((java-mode . "java")
                        (awk-mode . "awk")
                        (c-mode . "linux")
                        (other . "gnu")))

(defun kb/c-mode ()
  "C minor mode configurations."
  (lsp-mode)
  (lsp-deferred))

(add-hook 'c-mode-hook #'kb/c-mode)
(add-hook 'c++-mode-hook #'kb/c-mode)

(provide 'init-c)
;;; init-c.el ends here
