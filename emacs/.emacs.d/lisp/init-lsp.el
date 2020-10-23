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
(defvar lsp-log-io)
(defvar lsp-trace)
(defvar lsp-print-performance)
(defvar lsp-auto-guess-root)
(defvar lsp-document-sync-method)
(defvar lsp-response-timeout)
(defvar lsp-clients-go-server-args)
(defvar lsp-ui-doc-delay)
(defvar lsp-ui-sideline-enable)
(defvar lsp-ui-sideline-show-symbol)
(defvar lsp-ui-imenu-enable)
(defvar lsp-ui-imenu-kind-position)
(defvar lsp-ui-flycheck-enable)
(defvar lsp-ui-peek-enable)
(defvar lsp-ui-peek-fontify)
(defvar lsp-ui-peek-list-width)
(defvar lsp-ui-peek-list-height)
(defvar lsp-ui-sideline-code-actions-prefix)
(defvar lsp-ui-sideline-ignore-duplicate)
(defvar lsp-ui-sideline-show-code-actions)
(defvar lsp-ui-sideline-show-diagnostics)
(defvar lsp-ui-sideline-show-hover)
(defvar lsp-ui-sideline-show-symbol)


(use-package lsp-mode
  :config
  (setq lsp-log-io nil
        lsp-trace nil
        lsp-print-performance nil
        lsp-auto-guess-root t
        lsp-document-sync-method 'incremental
        lsp-response-timeout 10
        lsp-prefer-flymake nil
        lsp-inhibit-message t
        lsp-eldoc-render-all nil
        lsp-enable-file-watchers nil
        lsp-highlight-symbol-at-point nil
        lsp-clients-clangd-args '("-j=4"
                                  "-background-index"
                                  "-log=error")
        lsp-clients-go-server-args '("--cache-style=always"
                                     "--diagnostics-style=onsave")))

(use-package lsp-ui
  :after lsp
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-delay 0.3
        lsp-ui-sideline-enable nil
        lsp-ui-flycheck-enable t
        lsp-ui-imenu-enable t
        lsp-ui-imenu-kind-position 'top
        lsp-ui-peek-enable t
        lsp-ui-peek-fontify 'on-demand
        lsp-ui-peek-list-width 50
        lsp-ui-peek-list-height 20
        lsp-ui-sideline-code-actions-prefix ""
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-symbol nil))

(use-package helm-lsp :after (lsp-mode helm))

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
;;; init-lsp.el ends here
