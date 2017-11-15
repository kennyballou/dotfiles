;;; init-ledger --- Ledger Mode Configuration
;;; Commentary:
;;; Code:

(use-package ledger-mode
  :ensure t
  :bind (("RET" . newline)
         ("C-o" . open-line))
  :init
  (add-to-list 'auto-mode-alist '("\\.ledger$" . ledger-mode))
  (add-hook 'ledger-mode-hook 'goto-address-prog-mode)
  ;; Use ISO format
  (setq ledger-default-date-format "%Y-%m-%d")
  :config

  (when (maybe-require-package 'flycheck-ledger)
    (with-eval-after-load 'flycheck
      (with-eval-after-load 'ledger-mode)
      (require 'flycheck-ledger)))

  )

(provide 'init-ledger)
;;; init-ledger.el ends here
