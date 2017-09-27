(require-package 'haml-mode)

(with-eval-after-load 'haml-mode
  (define-key haml-mode-map (kbd "C-o") 'open-line))

(provide 'init-haml)
