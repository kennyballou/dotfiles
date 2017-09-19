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

(global-set-key [remap just-one-space] 'cycle-spacing)

(setq-default indicate-empty-lines t)

(setq whitespace-display-mapping
      '(
        (newline-mark 10 [60 10])
        (tab-mark 9 [187 9] [92 9])
        ))

(setq
 whitespace-space 'whitespace-space
 whitespace-tab 'whitespace-tab
 whitespace-trailing 'whitespace-trailing
 whitespace-newline 'whitespace-newline
 whitespace-empty 'whitespace-empty
 whitespace-lines-tail 'whitespace-lines-tail)

;; Indent
(setq standard-indent 4)
(setq-default tab-width 4
              indent-tabs-mode nil)


(provide 'init-whitespace)
