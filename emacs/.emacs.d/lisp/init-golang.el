;;; init-golang --- Go Mode Configuration and Setup
;;; Commentary:
;;; Code:

(defvar go-mode)
(defvar go-autocomplete)
(defvar before-save-hook)

(use-package go-autocomplete
  :after (auto-complete-mode)
  :defer t
  :config
  (ac-config-default))

(use-package go-mode
  :after (go-autocomplete)
  :commands (gofmt-before-save)
  :defer t
  :config
  (add-hook 'go-mode-hook (lambda ()
                            (setq indent-tabs-mode t)
                            (setq tab-width 4)))
  (add-hook 'before-save-hook #'gofmt-before-save))

(provide 'init-golang)
;;; init-golang.el ends here
