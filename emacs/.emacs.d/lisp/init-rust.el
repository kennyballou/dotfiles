;;; init-rust --- Rust mode configuration
;;; Commentary:
;;; Code:

(defvar rust-mode)
(defvar racer)

(use-package racer
  :defer t
  :hook ((racer-mode-hook . eldoc-mode)))

(use-package rust-mode
  :after racer
  :hook ((rust-mode-hook . racer-mode)))

(provide 'init-rust)
;;; init-rust.el ends here
