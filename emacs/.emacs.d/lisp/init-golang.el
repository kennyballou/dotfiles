;;; init-golang --- Go Mode Configuration and Setup
;;; Commentary:
;;; Code:

(defvar go-mode)
(defvar go-autocomplete)

(use-package go-autocomplete
  :after (auto-complete-mode)
  :defer t
  :config
  (ac-config-default))

(use-package go-mode
  :after (go-autocomplete)
  :defer t
  :hook (go-mode-hook . (lambda ()
                          (setq indent-tabs-mode t)
                          (setq tab-width 4))))

(provide 'init-golang)
;;; init-golang.el ends here
