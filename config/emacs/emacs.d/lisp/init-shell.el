;;; init-shell --- Shell and Comint Configuration
;;; Commentary:
;;; Code:

(defvar bash-completion)

(require 'shell)
(require 'sh-script)

;; https://www.masteringemacs.org/article/shell-comint-secrets-history-commands
(define-key shell-mode-map (kbd "SPC") #'comint-magic-space)

;; helm comint input ring "history"
(define-key shell-mode-map (kbd "C-c C-l") #'helm-comint-input-ring)

;; execute region
(define-key sh-mode-map (kbd "C-x C-e") #'sh-send-line-or-region-and-step)

;; https://github.com/szermatt/emacs-bash-completion
(autoload 'bash-completion-dynamic-complete
  "bash-completion"
  "BASH completion hook")
(add-hook 'shell-dynamic-complete-functions
          'bash-completion-dynamic-complete)

(with-eval-after-load 'shell
  (native-complete-setup-bash))

(defun shell-mode-hook-setup ()
  "Setup `shell-mode'."
  (add-hook 'completion-at-point-functions #'native-complete-at-point nil t)
  (setq-local company-backends '((company-files company-native-complete)))
  (local-set-key (kbd "TAB") #'company-complete))
(add-hook 'shell-mode-hook #'shell-mode-hook-setup)

(use-package vterm)

(provide 'init-shell)
;;; init-shell.el ends here
