;;; init-rust --- Rust mode configuration
;;; Commentary:
;;; Code:

(defvar rust-mode)
(defvar racer)

(use-package racer
  :hook ((racer-mode-hook . eldoc-mode)))

(use-package rust-mode
  :after racer
  :init
  (defun kb/rust-mode ()
    (racer-mode)
    (lsp-mode)
    (lsp-deferred))
  :hook (rust-mode-hook . kb/rust-mode))

(provide 'init-rust)
;;; init-rust.el ends here
