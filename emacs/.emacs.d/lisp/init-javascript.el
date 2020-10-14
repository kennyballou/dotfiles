;;; init-javascript --- Javascript and related modes configuration
;;; Commentary:
;;; Code:

(defvar json-mode)
(defvar js2-mode)
(defvar coffee-mode)
(defvar typescript-mode)
(defvar add-node-modules-path)
(defvar auto-mode-list)
(defvar melpa-unstable)

(use-package json-mode)
(use-package js2-mode
  :init
  (defun kb/js2-mode ()
    (lsp-mode)
    (lsp-deferred))
  :hook (js2-mode . kb/js2-mode)
  :config
  (setq-default js2-basic-offset 4
                js2-bounce-indent-p nil))
(use-package coffee-mode)
(use-package typescript-mode
  :init
  (defun kb/typescript-mode ()
    (lsp-mode)
    (lsp-deferred))
  :hook (typescript-mode . kb/typescript--mode))

(defcustom preferred-javascript-mode
  (first (remove-if-not #'fboundp '(js2-mode js-mode)))
  "Javascript mode to use for .js files."
  :type 'symbol
  :group 'programming
  :options '(js2-mode js-mode))

(defconst preferred-javascript-indent-level 4)

;; Need to first remove from list if present, since elpa adds entries too, which
;; may be in an arbitrary order
(eval-when-compile (require 'cl))
(setq auto-mode-list (cons `("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . ,preferred-javascript-mode)
                           (loop for entry in auto-mode-alist
                                 unless (eq preferred-javascript-mode (cdr entry))
                                 collect entry)))

;; js-2 mode
;; change some defaults

(with-eval-after-load 'js2-mode
  ;; Disable js2-mode's syntax error highlighting by default ...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck")
  (defun sanityinc/disable-js2-checks-if-flycheck-active ()
    (unless (flycheck-get-checker-for-buffer)
      (set (make-local-variable 'js2-mode-show-parse-errors) t)
      (set (make-local-variable 'js2-mode-show-strict-warnings) t)))
  (add-hook 'js2-mode-hook 'sanityinc/disable-js2-checks-if-flycheck-active)

  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))

  (with-eval-after-load 'js2-mode
    (js2-imenu-extras-setup)))

;; js-mode
(setq-default js-indent-level preferred-javascript-indent-level)

(add-to-list 'interpreter-mode-alist (cons "node" preferred-javascript-mode))

(use-package xref-js2
  :after js2-mode
  :defer t
  :config
  (add-to-list 'xref-backend-functions #'xref-js2-xref-backend))

(when (fboundp 'coffee-mode)
  (add-to-list 'auto-mode-alist '("\\.coffee\\.erb\\'" . coffee-mode)))

;; Run and interact with an inferior JS via js-comint.el

(use-package js-comint
  :init
  (setq inferior-js-program-command "node")

  (defvar inferior-js-minor-mode-map (make-sparse-keymap))
  (define-key inferior-js-minor-mode-map (kbd "C-x C-e") 'js-send-last-sexp)
  (define-key inferior-js-minor-mode-map (kbd "C-M-x") 'js-send-last-sexp-and-go)
  (define-key inferior-js-minor-mode-map (kbd "C-c b") 'js-send-buffer)
  (define-key inferior-js-minor-mode-map (kbd "C-c C-b") 'js-send-buffer-and-go)
  (define-key inferior-js-minor-mode-map (kbd "C-c l") 'js-load-file-and-go)

  (define-minor-mode inferior-js-keys-mode
    "Bindings for communicating with inferior js interpreter."
    nil "InfJS" inferior-js-minor-mode-map)

  (dolist (hook '(js2-mode-hook js-mode-hook))
    (add-hook hook 'inferior-js-keys-mode)))

;;; Alternatively, use skewer mode
(use-package skewer-mode
  :init
  (add-hook 'skewer-mode-hook
            (lambda () (inferior-js-keys-mode -1))))

(use-package add-node-modules-path
  :after (typescript-mode js2-mode)
  :defer t
  :hook ((typescript-mode . add-node-modules-path)
         (js2-mode . add-node-modules-path)))

(provide 'init-javascript)
;;; init-javascript.el ends here
