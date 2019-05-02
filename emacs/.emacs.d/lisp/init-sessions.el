;;; init-sessions --- Session management configuration
;;; Commentary:
;;; Code:

(defvar desktop-path)
(defvar desktop-auto-save-timeout)
(defvar session)
(defvar session-save-file)
(defvar session-name-disable-regexp)
(defvar session-save-file-coding-system)
(defvar session-initialize)
(defvar desktop-globals-to-save)
(defvar desktop-restore-eager)
(defvar desktop-files-not-to-save)
(defvar desktop-modes-not-to-save)

;; save list of open files to ~/.emacs.d/.emacs.desktop
(setq desktop-path (list user-emacs-directory)
      desktop-restore-frames nil
      desktop-auto-save-timeout 600
      desktop-restore-eager 10
      desktop-files-not-to-save
      "\\(^/[^/:]*:\\|(ftp)$\\)|\\(^*.pdf$\\)\\|\\(^*.jpg$\\)\\|\\(^*.png$\\)")
(desktop-save-mode 1)

;; Restore histories and registers after saving
(setq-default history-length 1000)
(add-hook 'after-init-hook (lambda () savehist-mode t))

(use-package session
  :init
  (setq session-save-file (expand-file-name ".session" user-emacs-directory))
  (setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
  (setq session-save-file-coding-system 'utf-8)
  :hook (after-init-hook . #'session-initialize))

;; save a bunch of variables to the desktop file
;; for lists specify the length of the maximal saved data also
(setq desktop-globals-to-save
      (append '((comint-input-ring . 50)
                (compile-history . 30)
                desktop-missing-file-warning
                (dired-regexp-history . 20)
                (extended-command-history . 30)
                (face-name-history . 20)
                (file-name-history . 100)
                (grep-find-history . 30)
                (grep-history . 30)
                (ido-buffer-history . 100)
                (ido-last-directory-list . 100)
                (ido-work-directory-list . 100)
                (ido-work-file-list . 100)
                (ivy-history . 100)
                (magit-read-rev-history . 50)
                (minibuffer-history . 50)
                (org-clock-history . 50)
                (org-refile-history . 50)
                (org-tags-history . 50)
                (query-replace-history . 60)
                (read-expression-history . 60)
                (regexp-history . 60)
                (regexp-search-ring . 20)
                register-alist
                (search-ring . 20)
                (shell-command-history . 50)
                tags-file-name
                tags-table-list)))

(provide 'init-sessions)
;;; init-sessions.el ends here
