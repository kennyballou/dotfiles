;;; init-dap --- Debug Adapter Protocol Setup and Configuration
;;; Commentary:
;;; Code:

(defvar lsp-mode)
(defvar dap-mode)
(defvar dap-hydra)
(defvar dap-ui-mode)
(defvar dap-tooltip-mode)

(use-package dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-auto-configure-mode)
  (dap-ui-mode t)
  (dap-tooltip-mode t)
  (bind-key (kbd "<f7>") #'dap-step-in dap-mode-map)
  (bind-key (kbd "<f8>") #'dap-next dap-mode-map)
  (bind-key (kbd "<f9>") #'dap-continue dap-mode-map))

(use-package dap-hydra
  :after dap-mode)

(provide 'init-dap)
;;; init-dap.el ends here
