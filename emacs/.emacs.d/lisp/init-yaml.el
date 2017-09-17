(when (maybe-require-package 'yaml-mode)
  (add-audo-mode 'yaml-mode "\\.yml\\.erb'")
  (add-hook 'yaml-mode-hook 'goto-address-prog-mode))

(provide 'init-yaml)
