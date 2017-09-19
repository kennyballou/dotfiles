(require-package 'go-mode)
(require-package 'go-autocomplete)

(when (boundp 'auto-complete-mode)
  (require 'go-autocomplete)
  (ac-config-default))

(add-hook 'go-mode-hook
          (lambda () (setq indent-tabs-mode nil
                           (setq tab-width 2))))

(provide 'init-golang)
