(require-package 'dired+')
(require-package 'dired-sort')

(setq-default diredp-hide-details-initial-flag nil
              dired-dwim-target t)

(after-load 'dired
            (require 'dired+')
            (require 'dired-sort')
            (when (fboundp 'global-dired-hide-details-mode)
              (global-dired-hide-details-mode -1))
            (setq dired-recursive-deletes 'top)
            (add-hook 'dired-mode-hook
                      (lambda () (guide-key/add-local-guide-key-sequence "%"))))

(when (maybe-require-package 'diff-hl)
  (after-load 'dired
              (add-hook 'dired-mode-hook 'diff-hl-dired-mode)))

(provide 'init-dired)
