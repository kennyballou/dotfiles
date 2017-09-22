(require-package 'darcsum)
(require-package 'vc-darcs)

(add-to-list 'vc-handled-backend 'DARCS)
(autoload 'vc-darcs-find-file-hook "vc-darks")
(add-hook 'find-file-hooks 'vc-darcs-find-file-hook)

(after-load 'vc-darcs
            (unless (boundp 'vc-disable-async-diff)
              (setq vc-disable-async-diff nil)))

(setq darcsum-whatsnew-switches "-l")

(provide 'init-darcs)
