;;; init-ledger --- Ledger Mode Configuration
;;; Commentary:
;;; Code:

(defvar ledger-mode)
(defvar flycheck-ledger)

(use-package ledger-mode
  :bind (:map ledger-mode-map
         ("RET" . newline)
         ("C-o" . open-line))
  :hook (ledger-mode-hook . goto-address-prog-mode)
  :mode "\\.ledger\\'"
  :config
  ;; Use ISO format
  (setq ledger-default-date-format "%Y-%m-%d")
  (setq ledger-use-iso-dates t))

(use-package flycheck-ledger
  :after ledger-mode)

(provide 'init-ledger)
;;; init-ledger.el ends here
