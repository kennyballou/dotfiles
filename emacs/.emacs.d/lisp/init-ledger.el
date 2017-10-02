(when (maybe-require-package 'ledger-mode)
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))

  (when (maybe-require-package 'flycheck-ledger)
    (with-eval-after-load 'flycheck
      (with-eval-after-load 'ledger-mode)
      (require 'flycheck-ledger)))

  (with-eval-after-load 'ledger-mode
    (define-key ledger-mode-map (kbd "RET") 'newline)
    (define-key ledger-mode-map (kbd "C-o") 'open-line))

  ;; Use ISO format
  (setq ledger-default-date-format "%Y-%m-%d")

  (with-eval-after-load 'ledger-mode
    (when (memq window-system '(mac ns))
      (exec-path-from-shell-copy-env "LEDGER_FILE")))

  (add-hook 'ledger-mode-hook 'goto-address-prog-mode))

(provide 'init-ledger)
