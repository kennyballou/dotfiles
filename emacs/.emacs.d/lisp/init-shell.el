;;; init-shell --- Shell and Comint Configuration
;;; Commentary:
;;; Code:

(require 'shell)

;; https://www.masteringemacs.org/article/shell-comint-secrets-history-commands
(define-key shell-mode-map (kbd "SPC") #'comint-magic-space)

;; helm comint input ring "history"
(define-key shell-mode-map (kbd "C-c C-l") #'helm-comint-input-ring)

(provide 'init-shell)
;;; init-shell.el ends here
