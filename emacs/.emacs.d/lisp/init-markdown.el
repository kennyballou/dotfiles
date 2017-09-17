(when (maybe-require-package 'markdown-mode)
  (add-audo-mode 'markdown-mode "\\.md\\.html\\'")
  (after-load 'whitespace-cleanup-mode
              (push 'markdown-mode whitespace-cleanup-mode-ignore-mode)))

(provide 'init-markdown)
