;;; init-toml --- TOML configuration
;;; Commentary:
;;; Code:

(defvar toml-mode)
(defvar melpa-unstable)

(use-package toml-mode
  :hook ((toml-mode-hook . goto-address-prog-mode)))

(provide 'init-toml)
;;; init-toml.el ends here
