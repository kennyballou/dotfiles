;;; init-git --- Git and Magit Customization
;;; Commentary:
;;; Code:

(defvar magit)
(defvar magit-status-mode-map)
(defvar magit-status)
(defvar magit-mode-quit-window)
(defvar magit-toplevel)
(defvar magit-read-string-ns)
(defvar magit-remote-arguments)
(defvar magit-get)
(defvar magit-remote-add)
(defvar magit-define-popup-action)
(defvar gitignore-mode)
(defvar gitconfig-mode)
(defvar git-timemachine)

(use-package gitignore-mode)
(use-package gitconfig-mode)
(use-package git-timemachine)
(use-package ghub
  :ensure t
  :pin melpa-unstable)

(use-package magit
  :after ghub
  :preface
  (defun magit-dired-other-window ()
    (interactive)
    (dired-other-window (magit-toplevel)))
  :commands (magit-clone
             magit-toplevel
             magit-read-string-ns
             magit-remote-arguments
             magit-get
             magit-remote-add
             magit-define-popup-action)
  :bind (("C-x g" . magit-status)
         ("C-x M-G" . magit-dispatch-popup)
         :map magit-mode-map
         ("C-o" . magit-dired-other-window))
  :init
  (setq-default magit-diff-refine-hunk t)
  (defvar magit-last-seen-setup-instructions "1.4.0")
  (add-hook 'magit-popup-mode-hook 'sanityinc/no-trailing-whitespace)
  )

(use-package fullframe
  :requires magit
  :preface
  (fullframe magit-status magit-mode-quit-window)
  )

(use-package with-editor
  :ensure t
  :pin melpa-unstable)
(use-package git-commit
  :after with-editor
  :hook
  (git-commit-mode-hook . (lambda ()
                            'goto-address-mode
                            (set-fill-column 72)
                            (global-whitespace-mode nil)))
  :custom
  (git-commit-summary-max-length 50))

(provide 'init-git)
;;; init-git.el ends here
