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
(defvar lsp-clients-clangd-args)
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
(defvar lsp-semantic-tokens-enable)
(defvar lsp-completion-provider)
(defvar lsp-idle-delay)
(defvar lsp-modeline-code-actions-enable)
(defvar lsp-modeline-diagnostics-enable)
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
(defvar lsp-ui-doc-show-with-cursor)
(defvar lsp-ui-doc-position)
(defvar lsp-ui-doc-alignment)
(defvar lsp-auto-configure)
(defvar lsp-file-watch-ignored)


(use-package lsp-mode
  :config
  (setq lsp-log-io nil)
  (setq lsp-trace nil)
  (setq lsp-auto-configure nil)
  (setq lsp-print-performance nil)
  (setq lsp-auto-guess-root t)
  (setq lsp-document-sync-method 'incremental)
  (setq lsp-response-timeout 10)
  (setq lsp-prefer-flymake nil)
  (setq lsp-idle-delay 0.500)
  (setq lsp-inhibit-message t)
  (setq lsp-eldoc-render-all nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-highlight-symbol-at-point nil)
  (setq lsp-modeline-code-actions-enable nil)
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-clients-clangd-args '("-j=4"
                                  "--index"
                                  "-log=error"))
  (setq lsp-clients-go-server-args '("--cache-style=always"
                                     "--diagnostics-style=onsave"))
  (setq lsp-file-watch-ignored
        '("[/\\\\]\\.direnv$"
          "[/\\\\]\\.git$"
          "[/\\\\]\\.hg$"
          "[/\\\\]\\.bzr$"
          "[/\\\\]_darcs$"
          "[/\\\\]\\.svn$"
          "[/\\\\]_FOSSIL_$"
          "[/\\\\]\\.idea$"
          "[/\\\\]\\.ensime_cache$"
          "[/\\\\]\\.eunit$"
          "[/\\\\]node_modules$"
          "[/\\\\]\\.fslckout$"
          "[/\\\\]\\.tox$"
          "[/\\\\]\\.stack-work$"
          "[/\\\\]\\.bloop$"
          "[/\\\\]\\.metals$"
          "[/\\\\]target$"
          "[/\\\\]\\.deps$"
          "[/\\\\]\\.build-aux$"
          "[/\\\\]autom4te.cache$"
          "[/\\\\]\\.reference$"))
  (setq lsp-semantic-tokens-enable t)
  (setq lsp-completion-provider ':capf))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-doc-delay 0.3)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-imenu-enable t)
  (setq lsp-ui-imenu-kind-position 'top)
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-peek-fontify 'on-demand)
  (setq lsp-ui-peek-list-width 50)
  (setq lsp-ui-peek-list-height 20)
  (setq lsp-ui-sideline-code-actions-prefix "")
  (setq lsp-ui-sideline-ignore-duplicate t)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-symbol nil)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-position 'top)
  (setq lsp-ui-doc-alignment 'window))

(use-package helm-lsp :after (lsp-mode helm))

;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(provide 'init-lsp)
;;; init-lsp.el ends here
