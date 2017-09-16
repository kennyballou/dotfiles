;; Use smex to handle M-x
(when (maybe-require-package 'smex)
  ;; change path for ~/.smex-items
  (setq-default smex-save-file (expand-file ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

(provide 'init-smex)
