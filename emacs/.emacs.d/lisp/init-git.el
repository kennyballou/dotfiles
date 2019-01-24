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
(use-package git-timemachine
  :defer 1
  :diminish)

(use-package magit
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
  :config
  (fullframe magit-status magit-mode-quit-window)
  )

(use-package magit-extras
  :after magit
  :ensure nil
  :init
  (setq magit-pop-revision-stack-format '("%h (\"%s\", %ad)")))

(use-package with-editor
  :ensure t
  :pin melpa-unstable)

;; Some added additions from
;; https://www.reddit.com/r/emacs/comments/96r8us/tip_how_to_get_started_with_git/
(use-package git-commit
  :after with-editor magit
  :hook
  (git-commit-mode . my/git-commit-config-setup)
  :preface
  (defun my/git-commit-config-setup ()
    "Configures several commit message settings."
    (goto-address-mode)
    (set-fill-column 72)
    (setq-local comment-auto-fill-only-comments nil)
    (global-whitespace-mode nil))
  :custom
  (git-commit-summary-max-length 50))

(provide 'init-git)
;;; init-git.el ends here
