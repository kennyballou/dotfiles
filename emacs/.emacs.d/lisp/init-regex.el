(maybe-require-package 'regex-tool)

(setq-default regex-tool-backend 'perl)

(after-load 're-builder
            ;;support a slightly more idomatic quit binding in re-builder
            (define-key reb-mode-map (kbd "C-c C-k") 'reb-quit))

(provide 'init-regex)
