;;; init-org --- Org mode configurations
;;; Commentary:
;;; Started from purcell:
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;; Various inclusions from glynnforrest:
;;; https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-org.el
;;; Various inclusions from jcf:
;;; https://github.com/jcf/emacs.d/blob/master/init-org.org
;;; Reworked with offerings from
;;; http://cachestocaches.com/2016/9/my-workflow-org-agenda/
;;; And
;;; http://doc.norang.ca/org-mode.htm
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
(defvar org-agenda-dim-blocked-tasks)
(defvar org-agenda-compact-blocks)
(defvar org-agenda-custom-commands)
(defvar org-agenda-show-future-repeats)
(defvar org-ditaa-jar-path)
(defvar melpa-unstable)
(defvar ob-elixir)
(defvar ess)
(defvar ob-go)
(defvar ob-ipython)
(defvar ob-mongo)
(defvar ox-gfm)
(defvar ob-ditaa)
(defvar org-babel-eval-in-repl)
(defvar htmlize)
(defvar fci-mode)
(defvar graphviz-dot-mode)


(require 'org)
(require 'ox-md)
(use-package ob-ditaa
  :ensure nil
  :config
  (setq org-ditaa-jar-path "~/.emacs.d/ditaa/ditaa.jar"))
(use-package graphviz-dot-mode)
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
      org-special-ctrl-a/e t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'error
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 75
      org-search-view-always-boolean t
      org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9)))
      org-refile-use-outline-path t
      org-indirect-buffer-display 'current-window
      org-enforce-todo-dependencies t
      org-fast-tag-selection-include-todo t
      org-use-fast-todo-selection t
      org-treat-S-cursor-todo-selection-as-state-change nil
      org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      org-agenda-dim-blocked-tasks nil
      org-agenda-compact-blocks t
      org-agenda-show-future-repeats t
      org-files (append
                 (file-expand-wildcards (concat org-directory "*.org"))
                 (file-expand-wildcards (concat org-directory "*/*.org"))
                 (file-expand-wildcards (concat org-directory "*/*/*.org")))
      org-log-state-notes-into-drawer t
      org-clock-persistence-insinuate t
      org-clock-persist t
      org-clock-in-resume t
      org-clock-into-drawer t
      org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t)
      org-babel-clojure-backend 'cider
      org-src-preserve-indentation nil
      org-edit-src-content-indentation 0
      ;; Agenda log mode items to display (closed and state changes by default)
      org-agenda-log-mode-items (quote (closed state))
      org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "notes.org"))
         (file-expand-wildcards (concat org-directory "refile.org"))
         (file-expand-wildcards (concat org-directory "house.org"))
         (file-expand-wildcards (concat org-directory "cars.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
"Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function #'bh/verify-refile-target)

(defvar org-projects-dir (expand-file-name (concat org-directory "projects")))
(defvar kb/org-refile (concat org-directory "refile.org"))
(defvar kb/org-notes-file (concat org-directory "notes.org"))
(defvar kb/org-journal-file (concat org-directory "journal.org"))
(defvar kb/org-bookmarks-file (concat org-directory "bookmarks.org"))
(setq org-default-notes-file kb/org-refile)

(setq org-capture-templates
      `(("t" "todo" entry (file kb/org-refile)
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("r" "respond" entry (file kb/org-refile)
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n"
         :clock-in t :clock-resume t :immediate-finish t)
        ("n" "note" entry (file kb/org-refile)
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("j" "Journal" entry (file+olp+datetree kb/org-journal-file)
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "org-protocol" entry (file kb/org-refile)
         "* TODO Review %c\n%U\n" :immediate-finish t)
        ("m" "Meeting" entry (file kb/org-refile)
         "* MEETING with %? :MEETING:\n%U"
         :clock-in t :clock-resume t)
        ("b" "Bookmark" entry (file kb/org-bookmarks-file)
         "* %x\n%U\n%?" :clock-resume t)
        ("p" "Phone call" entry (file kb/org-refile)
         "* PHONE %? :PHONE:\n%U"
         :clock-in t :clock-resume t)
        ))

(add-hook 'org-capture-mode-hook (lambda () (setq fill-column 72)))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h)" "INACTIVE(i)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-repeat-to-state "NEXT")

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#9C6363" :weight bold)
              ("NEXT" :foreground "#8CD0D3" :weight bold)
              ("DONE" :foreground "#8FB28F" :weight bold)
              ("WAITING" :foreground "#DFAF8F" :weight bold)
              ("HOLD" :foreground "#DC8CC3" :weight bold)
              ("INACTIVE" :foreground "#DC8CC3" :weight bold)
              ("CANCELLED" :foreground "#8FB28F" :weight bold)
              ("MEETING" :foreground "#8FB28F" :weight bold)
              ("PHONE" :foreground "#8FB28F" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("d" "Today"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile:")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-INACTIVE-HOLD-CANCELLED-ARCHIVE/!NEXT"
                           ((org-agenda-overriding-header "Next Tasks:"))))
               ((org-agenda-span 'day))))))

(defun kb/org-switch-to-current-notes-file ()
  "Open current notes file."
  (interactive)
  (find-file (concat org-directory "notes.org")))

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
     (ditaa . t)
     (dot . t)
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
  (if (and (projectile-project-p)
           (not (equal (projectile-project-name) ".org")))
      (gf/org-switch-to-project-org-file)
    (kb/org-switch-to-current-notes-file)))

(use-package org-pomodoro)

(provide 'init-org)
;;; init-org.el ends here
