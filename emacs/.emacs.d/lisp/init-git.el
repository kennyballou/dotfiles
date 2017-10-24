;;; init-git --- Git and Magit Customization
;;; Commentary:
;;; Code:

(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(maybe-require-package 'git-timemachine)

(when (maybe-require-package 'magit)
  (setq-default magit-diff-refine-hunk t)

  (customize-set-value 'git-commit-summary-max-length 50)

  (add-hook 'git-commit-setup-hook
            (lambda ()
              (setq fill-column 72)
              (global-whitespace-mode nil)
              ))

  ;; Hint: customize `magit-repo-dirs' so that can use C-u M-F12 to
  ;; quickly open magit on any of you projects.
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup))

(defvar magit-status-mode-map)
(defvar magit-status)
(defvar magit-mode-quit-window)

(with-eval-after-load 'magit
  (define-key magit-status-mode-map (kbd "C-M-<up>") 'magit-section-up)
  (add-hook 'magit-popup-mode-hook 'sanityinc/no-trailing-whitespace))

(require-package 'fullframe)
(with-eval-after-load 'magit
  (fullframe magit-status magit-mode-quit-window))

(when (maybe-require-package 'git-commit)
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(with-eval-after-load 'vc
  (define-key vc-prefix-map (kbd "f") 'vc-git-grep))

(autoload 'vc-git-root "vc-git")

(provide 'init-git)
;;; init-git.el ends here
