;;; init-yaml --- YAML configuration
;;; Commentary:
;;; Code:

(defvar yaml-mode)

(use-package yaml-mode
  :defer t
  :mode "\\.yml\\.erb\\'"
  :hook ((yaml-mode-hook . goto-address-prog-mode)))

(provide 'init-yaml)
;;; init-yaml.el ends here
