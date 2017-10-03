;;; init-term --- term mode configuration
;;; Commentary:
;;; Code:

(require-package 'multi-term)

(defvar term-buffer-maximum-size)
(defvar multi-term-program)
(setq multi-term-program "/bin/zsh")

(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 100000)))

(provide 'init-term)
;;; init-term.el ends here
