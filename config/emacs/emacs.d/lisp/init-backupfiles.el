;;; init-backupfiles --- backup and temp file configuration
;;; Commentary:
;;; Code:

;; Snippet taken from https://stackoverflow.com/a/18330742/7492588
(defconst --backup-directory (concat user-emacs-directory "backups/"))
(defconst --lockfile-directory (concat user-emacs-directory "lockfiles/")
  "Lockfiles and Autosave files directory.")
(unless (file-exists-p --backup-directory)
  (make-directory --backup-directory t)
  (set-file-modes --backup-directory #o700))
(unless (file-exists-p --lockfile-directory)
  (make-directory --lockfile-directory)
  (set-file-modes --lockfile-directory #o700))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq auto-save-file-name-transforms `((".*" ,--lockfile-directory t)))
(setq make-backup-files t)
(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq delete-by-moving-to-trash nil)
(setq kept-old-versions 6)
(setq kept-new-versions 9)
(setq auto-save-default t)
(setq auto-save-timeout 20)
(setq auto-save-interval 200)

(provide 'init-backupfiles)
;;; init-backupfiles.el ends here
