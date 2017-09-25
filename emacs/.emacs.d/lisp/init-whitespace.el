;;; init-whitespace --- whitespace configurations
;;; Commentary:
;;; Code:

(require-package 'whitespace)
(require-package 'whitespace-cleanup-mode)

(setq-default show-trailing-whitespace t)

;;; Whitespace

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby, etc
(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))

(global-whitespace-cleanup-mode t)
(global-whitespace-mode t)
(when (maybe-require-package 'diminish)
  (diminish 'global-whitespace-cleanup-mode)
  (diminish 'global-whitespace-mode))

(global-set-key [remap just-one-space] 'cycle-spacing)

(setq-default indicate-empty-lines t)

(defvar whitespace-display-mappings)
(setq whitespace-display-mappings
      '(
        (newline-mark 10  [8617 10])
        (tab-mark 9 [9654 9] [92 9])
        ))


;; Indent
(setq standard-indent 4)
(setq-default tab-width 4
              indent-tabs-mode nil)

;;newlines
(setq require-final-newline t)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
