;;; init-ledger --- Ledger Mode Configuration
;;; Commentary:
;;; Code:

(defvar ledger-mode)
(defvar flycheck-ledger)

(use-package ledger-mode
  :bind (:map ledger-mode-map
         ("RET" . newline)
         ("C-o" . open-line))
  :init
  (defun kb/ledger-mode ()
    "Configure ledger mode settings."
    (goto-address-prog-mode t)
    (page-break-lines-mode t))
  :hook (ledger-mode-hook . kb/ledger-mode)
  :mode "\\.ledger\\'"
  :config
  ;; Use ISO format
  (setq ledger-default-date-format "%Y-%m-%d")
  (setq ledger-use-iso-dates t))

(use-package flycheck-ledger
  :after ledger-mode)

(provide 'init-ledger)
;;; init-ledger.el ends here
