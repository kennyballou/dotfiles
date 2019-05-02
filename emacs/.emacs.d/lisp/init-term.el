;;; init-term --- term mode configuration
;;; Commentary:
;;; Code:

(defvar multi-term)
(defvar term-buffer-maximum-size)
(defvar multi-term-program)

(use-package multi-term
  :init
  (setq multi-term-program "/bin/zsh")
  (add-hook 'term-mode-hook
            (lambda ()
              (setq term-buffer-maximum-size 100000))))

(provide 'init-term)
;;; init-term.el ends here
