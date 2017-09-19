(require-package 'rainbow-mode)
(require-package 'rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-rainbow)
