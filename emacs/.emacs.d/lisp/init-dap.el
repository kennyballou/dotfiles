;;; init-dap --- Debug Adapter Protocol Setup and Configuration
;;; Commentary:
;;; Code:

(defvar dap-mode)
(defvar dap-hydra)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-hydra
  :after dap-mode)

(provide 'init-dap)
;;; init-dap.el ends here
