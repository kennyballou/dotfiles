(when (maybe-require-package 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.md\\.html\\'". 'markdown-mode)))

(provide 'init-markdown)
