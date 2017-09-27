(when (maybe-require-package 'diff-hl)
  (add-hook 'prog-mode-hook 'diff-hl-mode)
  (add-hook 'vc-dir-mode-hook 'diff-hl-mode))

(provide 'init-vc)
