;;; init-shell --- Shell and Comint Configuration
;;; Commentary:
;;; Code:

(require 'shell)

;; https://www.masteringemacs.org/article/shell-comint-secrets-history-commands
(define-key shell-mode-map (kbd "SPC") #'comint-magic-space)

(provide 'init-shell)
;;; init-shell.el ends here
