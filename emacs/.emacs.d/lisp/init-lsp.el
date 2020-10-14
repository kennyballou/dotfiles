;;; init-lsp --- Language Server Protocol Setup and Configuration
;;; Commentary:
;;; Code:

(defvar lsp)
(defvar helm)
(defvar lsp-mode)
(defvar lsp-ui-mode)
(defvar lsp-ui)
(defvar helm-lsp)
(defvar company-lsp)
(defvar lsp-treemacs)
(defvar lsp-inhibit-message)
(defvar lsp-eldoc-render-all)
(defvar lsp-enable-file-watchers)
(defvar lsp-highlight-symbol-at-point)
(defvar lsp-prefer-flymake)
(defvar lsp-ui-doc-delay)
(defvar lsp-ui-sideline-enable)
(defvar lsp-ui-sideline-show-symbol)

(use-package lsp-mode
  :config
  (setq lsp-inhibit-message t
        lsp-eldoc-render-all nil
        lsp-enable-file-watchers nil
        lsp-highlight-symbol-at-point nil
        lsp-clients-clangd-args '("-j=4"
                                  "-background-index"
                                  "-log=error")))

(use-package lsp-ui
  :after lsp
  :commands lsp-ui-mode
  :config
  (setq lsp-prefer-flymake nil
        lsp-ui-doc-delay 0.3
        lsp-ui-sideline-enable nil
        lsp-ui-sideline-show-symbol nil))

(use-package helm-lsp :after (lsp-mode helm))

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
;;; init-lsp.el ends here
