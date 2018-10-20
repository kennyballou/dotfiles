;;; init-org --- Org mode configurations
;;; Commentary:
;;; Started from purcell:
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;; Various inclusions from glynnforrest:
;;; https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-org.el
;;; Various inclusions from jcf:
;;; https://github.com/jcf/emacs.d/blob/master/init-org.org
;;; Code:

(defvar org-cliplink)
(defvar org-fstree)
(defvar org-archive-mark-done)
(defvar org-export-kill-product-buffer-when-displayed)
(defvar org-search-view-always-boolean)
(defvar org-files)
(defvar org-clock-persistence-insinuate)
(defvar org-clock-persist)
(defvar org-clock-in-resume)
(defvar org-clock-in-switch-to-state)
(defvar org-clock-into-drawer)
(defvar org-babel-clojure-backend)
(defvar org-capture-templates)
(defvar org-pomodoro)
(defvar melpa-unstable)
(defvar ob-elixir)
(defvar ess)
(defvar ob-go)
(defvar ob-ipython)
(defvar ob-mongo)
(defvar ox-gfm)
(defvar org-babel-eval-in-repl)
(defvar htmlize)
(defvar fci-mode)

(require 'org)
(require 'ox-md)
(use-package org-cliplink
  :pin melpa-unstable)
;; (use-package org-fstree
;;   :pin melpa-unstable)
(use-package ob-elixir
  :pin melpa-unstable)
(use-package ess
  :pin melpa-unstable)
(use-package ob-go
  :pin melpa-unstable)
(use-package ob-mongo
  :pin melpa-unstable)
(use-package ox-gfm)
(use-package org-babel-eval-in-repl
  :pin melpa-unstable)
;; https://www.reddit.com/r/emacs/comments/57gteu/org_export_html_source_code_blocks_adds_trailing/
;; https://github.com/kaushalmodi/.emacs.d/blob/15df5b075a4cd4a8ed7332237c0e33e75b430a36/setup-files/setup-htmlize.el#L10-L28
(use-package htmlize
  :defer t
  :config
  (progn

    ;; It is required to disable `fci-mode' when `htmlize-buffer' is called;
    ;; otherwise the invisible fci characters show up as funky looking
    ;; visible characters in the source code blocks in the html file.
    ;; http://lists.gnu.org/archive/html/emacs-orgmode/2014-09/msg00777.html
    (with-eval-after-load 'fill-column-indicator
      (defvar modi/htmlize-initial-fci-state nil
        "Variable to store state of `fci-mode' when `htmlize-buffer' is called.")

      (defun modi/htmlize-before-hook-fci-disable ()
        (setq modi/htmlize-initial-fci-state fci-mode)
        (when fci-mode
          (fci-mode -1)))

      (defun modi/htmlize-after-hook-fci-enable-maybe ()
        (when modi/htmlize-initial-fci-state
          (setq fci-mode 1)))

      (add-hook 'htmlize-before-hook #'modi/htmlize-before-hook-fci-disable)
      (add-hook 'htmlize-after-hook #'modi/htmlize-after-hook-fci-enable-maybe))

    ;; `flyspell-mode' also has to be disabled because depending on the
    ;; theme, the squiggly underlines can either show up in the html file
    ;; or cause elisp errors like:
    ;; (wrong-type-argument number-or-marker-p (nil . 100))
    (with-eval-after-load 'flyspell
      (defvar modi/htmlize-initial-flyspell-mode nil
        "Variable to store state of `flyspell-mode' when
`htmlize-buffer` is called.")

      (defun modi/htmlize-before-hook-flyspell-disable ()
        (setq modi/htmlize-initial-flyspell-mode flyspell-mode)
        (when flyspell-mode
          (setq flyspell-mode -1)))

      (defun modi/htmlize-after-hook-flyspell-enable-maybe ()
        (when modi/htmlize-initial-flyspell-mode
          (setq flyspell-mode 1)))

      (add-hook 'htmlize-before-hook
                #'modi/htmlize-before-hook-flyspell-disable)
      (add-hook 'htmlize-after-hook
                #'modi/htmlize-after-hook-flyspell-enable-maybe))))

(use-package ob-ipython
  :pin melpa-unstable
  :defer t)

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(unbind-key "<M-S-left>" org-mode-map)
(unbind-key "<M-S-right>" org-mode-map)

;; Various preferences
(setq org-log-done t
      org-directory "~/.org/"
      org-ellipsis "⤵"
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 75
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
      org-log-state-notes-into-drawer t
      org-clock-persistence-insinuate t
      org-clock-persist t
      org-clock-in-resume t
      org-clock-in-switch-to-state "IN-PROGRESS"
      org-clock-into-drawer t
      org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)
      org-babel-clojure-backend 'cider
      org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "notes/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))


(defvar org-projects-dir (expand-file-name
                          (concat org-directory "projects")))

(setq org-capture-templates
      `(("t" "todo" entry (file+headline kb/org-current-notes-file "Tasks")
         "* TODO %?\n%U\n")
        ("n" "note" entry (file+headline kb/org-current-notes-file "Notes")
         "* %? :NOTE:\n%U\n%a\n")
        ("x" "project todo" entry (file+headline
                                   gf/org-resolve-project-org-file "Tasks")
         "* TODO %?\n%U\n")
        ("z" "project note" entry (file+headline
                                   gf/org-resolve-project-org-file "Notes")
         "* %? :NOTE:\n%U\n%a\n")
        ("r" "respond" entry (file+headline kb/org-current-notes-file "Tasks")
         "* NEXT Respond %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")
        ("m" "Meeting" entry (file+headline kb/org-current-notes-file "Tasks")
         "* MEETING with %? :MEETING:\n%U")
        ))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "IN-PROGRESS(s!)" "|" "DONE(d!/!)")
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
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*.org"))
         ))
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

(defun kb/create-org-path (path)
  "Transform path name into suitable org file name from last part(s) of PATH.
A new version of `gf/create-org-path'."
  (defun suitable-name (name)
    "Transform NAME into suitable name."
    (downcase
     (replace-regexp-in-string
      "\\." "-" (if (equal (substring name 0 1) ".")
                    (substring name 1) name))))
  (let* ((path-components (kb/get-qualified-project-pair path))
         (org-name (car path-components))
         (project-name (car (cdr path-components))))
    (concat org-projects-dir "/"
            (suitable-name org-name) "/"
            (suitable-name project-name) ".org")))

(defun kb/get-qualified-project-pair (project-folder)
  "Return tuple of parent and project directory for PROJECT-FOLDER."
  (let* ((path-components (split-string
                           (directory-file-name project-folder)
                           (f-path-separator)))
         (org-name (car (last path-components 2)))
         (project-name (car (last path-components))))
    (list org-name project-name)))


(defvar gf/org-project-file-override-alist '()
  "An association list of projectile directories and the project org file.
This enables overriding the default behaviour of
`gf/org-resolve-project-org-file'.  CAR must be an absolute path
to a project, including a trailing slash.  CDR must be a path to
an org file, relative to `org-directory'.
Example:
\'((\"/home/emacs/some-company/some-project\"
\"projects/some-company.org\")
\(\"/home/emacs/some-company/different-project\" \"projects/some-company.org\"))")

(defun gf/org-resolve-project-org-file ()
  "Get the path of the org file for the current project.
This version uses Glynn Forrest's assoc list, but uses a different version of
`create-org-path'.
\(https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-org.el\)"
  (if (assoc (projectile-project-root) gf/org-project-file-override-alist)
      (concat org-directory (cadr (assoc (projectile-project-root)
                                         gf/org-project-file-override-alist)))
    (kb/create-org-path (projectile-project-root))))


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
     (java . t)
     (js . t)
     (latex . t)
     (ledger . t)
     (mongo . t)
     (octave . t)
     (perl . t)
     (python . t)
     (ipython . t)
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

(use-package org-pomodoro)

(provide 'init-org)
;;; init-org.el ends here
