;;; init-org --- Org mode configurations
;;; Commentary:
;;; Started from purcell:
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;; Various inclusions from glynnforrest:
;;; https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-org.el
;;; Various inclusions from jcf:
;;; https://github.com/jcf/emacs.d/blob/master/init-org.org
;;; Code:

(require 'org)
(require 'ox-md)
(use-package org-cliplink)
(use-package org-fstree)
(use-package ob-elixir)
(use-package ob-go)
(use-package ob-ipython)
(use-package ob-mongo)
(use-package ox-gfm)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)

;; Various preferences
(setq org-log-done t
      org-directory "~/.org/"
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80
      org-search-view-always-boolean t
      org-refile-targets '((nil :maxlevel . 2))
      org-enforce-todo-dependencies t
      org-use-fast-todo-selection t
      org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-files (append
                 (file-expand-wildcards (concat org-directory "*/*.org"))
                 (file-expand-wildcards (concat org-directory "*/*/*.org")))
      org-clock-persistence-insinuate t
      org-clock-persist t
      org-clock-in-resume t
      org-clock-in-switch-to-state "STARTED"
      org-clock-into-drawer t
      org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)
      org-babel-clojure-backend 'cider
      org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "notes/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))


(defvar org-projects-dir (expand-file-name
                          (concat org-directory "projects")))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline kb/org-current-notes-file "Tasks")
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("n" "note" entry (file+headline kb/org-current-notes-file "Notes")
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("x" "Project todo" entry (file+headline
                                   gf/org-resolve-project-org-file "Tasks")
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("z" "Project note" entry (file+headline
                                   gf/org-resolve-project-org-file "Notes")
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("r" "respond" entry (file+headline kb/org-current-notes-file "Tasks")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: \t\n%U\n%a\n"
         :clock-in t :clock-resume t :immediate-finish t)
        ("w" "org-protocol" (file+headline kb/org-current-notes-file "Tasks")
         "* TODO Review %c\n%U\n" :immediate-finish t)
        ("m" "Meeting" (file+headline kb/org-current-notes-file "Meetings")
         "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
        ))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "PROJECT(p)" "|" "DONE(d!/!)" "CANCELLED(c@/!)")
              (sequence "WAITING(w@/!)" "DELEGATED(e!)" "HOLD(h)" "|" "CANCELLED(c@/!)")))
      org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("NEXT" :inherit warning)
              ("PROJECT" :inherit font-lock-string-face))))

(defun gf/org-reload ()
  "Reload the org file for the current month.
Useful for long running Emacs instance."
  (interactive)
  (setq org-files (append
                   (file-expand-wildcards (concat org-directory "*/*.org"))
                   (file-expand-wildcards (concat org-directory "*/*/*.org"))))

  ;; Notes are grouped by month in ~notes/~ for automatic archival.
  ;; At the start of every month, move over notes that are still relevant.
  ;; Agenda files are only used for searching - this setup is
  ;; desiged to work without scheduling, tags etc.
  (setq org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "notes/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))
  (setq org-default-notes-file (kb/org-current-notes-file)))

(defun kb/org-current-notes-file ()
  "Get the path for the current notes file.
Inspired by gf/org-current-month-notes-file"
  (concat org-directory "notes/"
          (format-time-string "%Y-%m.org")))

(defun kb/org-switch-to-current-notes-file ()
  "Open current notes file."
  (interactive)
  (find-file (kb/org-current-notes-file)))

(defun gf/org-refile-files-first ()
  "Choose an org file to file in, then pick the node.
This prevents Emacs opening all of the refile targets at once."
  (interactive)
  (let ((file (list (completing-read "Refile to: " org-files nil t))))
    (let ((org-refile-targets `((,file :maxlevel . 1))))
      (org-refile)))
  (org-save-all-org-buffers))

(defun gf/create-org-path (path)
  "Create a name suitable for an org file from the last part of the file PATH."
  (let ((last (car (last (split-string (if (equal (substring path -1) "/")
                                           (substring path 0 -1) path) "/")))))
    (concat org-projects-dir "/"
            (downcase
             (replace-regexp-in-string
              "\\." "-" (if (equal (substring last 0 1) ".")
                            (substring last 1) last)))
            ".org")))


(defun gf/org-resolve-project-org-file ()
  "Get the path of the org file for the current project."
  (gf/create-org-path (projectile-project-root)))

(defun gf/org-switch-to-project-org-file ()
  "Switch to the org file for the current project."
  (interactive)
  (find-file (gf/org-resolve-project-org-file)))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((awk . t)
     (clojure . t)
     (elixir . t)
     (emacs-lisp . t)
     (go . t)
     (gnuplot . t)
     (haskell . t)
     (ipython . t)
     (java . t)
     (js . t)
     (latex . t)
     (ledger . t)
     (mongo . t)
     (octave . t)
     (perl . t)
     (python . t)
     (R . t)
     (ruby . t)
     (scala . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (sql . t)
     (sqlite . t))))

(defun kb/org-switch-to-notes ()
  "Switch to notes.
Open either current project notes, or default notes file"
  (interactive)
  (if (projectile-project-p)
      (gf/org-switch-to-project-org-file)
    (kb/org-switch-to-current-notes-file)))

(global-set-key (kbd "C-c n") #'kb/org-switch-to-notes)

(provide 'init-org)
;;; init-org.el ends here
