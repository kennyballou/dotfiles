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
(defvar org-archive-location)
(defvar org-archive-mark-done)
(defvar org-export-kill-product-buffer-when-displayed)
(defvar org-search-view-always-boolean)
(defvar org-files)
(defvar org-clock-persistence-insinuate)
(defvar org-clock-persist)
(defvar org-clock-in-resume)
(defvar org-clock-in-switch-to-state)
(defvar org-clock-into-drawer)
(defvar org-clock-out-remove-zero-time-clocks)
(defvar org-babel-clojure-backend)
(defvar org-capture-templates)
(defvar org-capture-templates-contexts)
(defvar org-pomodoro)
(defvar org-agenda-dim-blocked-tasks)
(defvar org-agenda-compact-blocks)
(defvar org-agenda-custom-commands)
(defvar org-agenda-show-future-repeats)
(defvar org-agenda-log-mode-items)
(defvar org-agenda-exporter-settings)
(defvar org-attach-id-dir)
(defvar org-duration-format)
(defvar org-ditaa-jar-path)
(defvar org-ref)
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
(defvar org-id)
(defvar org-startup-folded)


(require 'org)
(require 'org-id)
(require 'holidays)
(require 'ox-md)
(use-package ob-ditaa
  :config
  (setq org-ditaa-jar-path (expand-file-name "~/.nix-profile/lib/ditaa.jar")))
(use-package graphviz-dot-mode)
(use-package org-cliplink)
(use-package ess)
(use-package ox-gfm)
(use-package org-babel-eval-in-repl)
(use-package org-ref
  :config
  (setq org-ref-completion-library 'org-ref-ivy-cite))
;; https://www.reddit.com/r/emacs/comments/57gteu/org_export_html_source_code_blocks_adds_trailing/
;; https://github.com/kaushalmodi/.emacs.d/blob/15df5b075a4cd4a8ed7332237c0e33e75b430a36/setup-files/setup-htmlize.el#L10-L28
(use-package htmlize
  :config
  (progn

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
      org-archive-location "%s_archive::datetree/"
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show-and-error
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 75
      org-search-view-always-boolean t
      org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9)))
      org-outline-path-complete-in-steps nil
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
      org-todo-repeat-to-state "TODO"
      org-files (append
                 (file-expand-wildcards (concat org-directory "*.org"))
                 (file-expand-wildcards (concat org-directory "*/*.org"))
                 (file-expand-wildcards (concat org-directory "*/*/*.org")))
      org-log-state-notes-into-drawer t
      org-clock-persistence-insinuate t
      org-clock-out-remove-zero-time-clocks t
      org-clock-persist t
      org-clock-in-resume t
      org-clock-into-drawer "CLOCK"
      org-duration-format (quote (("d" . nil) ("h" . t) ("min" . t)))
      org-babel-clojure-backend 'cider
      org-src-preserve-indentation nil
      org-edit-src-content-indentation 0
      ;; Agenda log mode items to display (closed and state changes by default)
      org-agenda-log-mode-items (quote (closed clock state))
      org-attach-id-dir (expand-file-name "~/.org/data")
      org-startup-folded 'overview
      org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "notes.org"))
         (file-expand-wildcards (concat org-directory "holidays.org"))
         (file-expand-wildcards (concat org-directory "refile.org"))
         (file-expand-wildcards (concat org-directory "house.org"))
         (file-expand-wildcards (concat org-directory "cars.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*.org"))
         (file-expand-wildcards (concat org-directory "projects/*/*/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))



(setq org-latex-prefer-user-labels t
      org-latex-listings t)
(setq org-latex-listings-options
      '(("breaklines" "true")
        ("firstnumber" "auto")
        ("frame" "single")
        ("mathescape" "true")
        ("numbers" "left")
        ("numbersep" "5pt")
        ("numberstyle" "\\tiny")
        ("showspaces" "false")
        ("showstringspaces" "false")
        ("stepnumber" "1")
        ("title" "\\lstname")))

(add-to-list 'org-latex-listings-langs '(scheme "Lisp"))

(add-to-list 'org-latex-default-packages-alist '("" "listings" t))

(setq org-latex-pdf-process
      '("pdflatex -interaction nonstopmode -output-directory %o %f"
        "bibtex %b"
        "pdflatex -interaction nonstopmode -output-directory %o %f"
        "pdflatex -interaction nonstopmode -output-directory %o %f"))



;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
"Exclude todo keywords with a done state from refile targets."
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function #'bh/verify-refile-target)

(defvar org-projects-dir (expand-file-name (concat org-directory "projects")))
(defvar kb/org-refile (concat org-directory "refile.org"))
(defvar kb/org-notes-file (concat org-directory "notes.org"))
(defvar kb/org-daily-file (concat org-directory "daily.org"))
(defvar kb/org-journal-file (concat org-directory "journal.org"))
(defvar kb/org-work-journal-file (concat org-directory "work.org"))
(defvar kb/org-bookmarks-file (concat org-directory "bookmarks.org"))
(setq org-default-notes-file kb/org-refile)

(defun kb/org-clocking-p ()
  "Return non-nil if currently tracking time, otherwise, nil."
  (not (eq nil (org-clock-is-active))))

(defun kb/org-not-clocking-p ()
  "Return nil if not tracking time, otherwise, non-nil."
  (eq nil (org-clock-is-active)))

(setq org-capture-templates
      '(("t" "todo" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/TODO") :clock-in t :clock-resume t)
        ("r" "respond" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/RESPOND")
         :clock-in t :clock-resume t :immediate-finish t)
        ("tn" "note on task" entry (clock)
         (file "~/.config/emacs/org-captures/TASK_NOTE") :empty-lines 1)
        ("n" "note" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/NOTE"))
        ("j" "Journal" entry (file+olp+datetree kb/org-journal-file)
         (file "~/.config/emacs/org-captures/JOURNAL")
         :clock-in t
         :clock-resume t)
        ("w" "Work Log" entry (file+olp+datetree kb/org-work-journal-file)
         (file "~/.config/emacs/org-captures/JOURNAL")
         :clock-in t
         :clock-resume t)
        ("d" "Daily Schedule" entry (file+olp+datetree kb/org-daily-file)
         (file "~/.config/emacs/org-captures/JOURNAL")
         :clock-resume t)
        ("o" "org-protocol" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/ORG-PROTOCOL")
         :immediate-finish t)
        ("m" "Meeting" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/MEETING")
         :clock-in t
         :clock-resume t)
        ("b" "Bookmark" entry (file kb/org-bookmarks-file)
         (file "~/.config/emacs/org-captures/BOOKMARK")
         :clock-resume t)
        ("p" "Phone call" entry (file+olp+datetree kb/org-journal-file)
         (file "~/.config/emacs/org-captures/PHONE")
         :clock-in t
         :clock-resume t)
        ("P" "Project" entry (file kb/org-refile)
         (file "~/.config/emacs/org-captures/PROJECT")
         :clock-in t
         :clock-resume t)
        ))

(setq org-capture-templates-contexts
      '(("n" "tn" (kb/org-clocking-p))
        ("n" "n" (kb/org-not-clocking-p))
        ("r" ((in-mode . "mu4e-view")))))

(add-hook 'org-capture-mode-hook (lambda () (setq fill-column 72)))
;; https://stackoverflow.com/a/16247032/7492588
(add-hook 'org-capture-prepare-finalize-hook #'org-id-get-create)

;;; https://emacs.stackexchange.com/q/51631/17096
(add-hook 'org-log-buffer-setup-hook (lambda () (setq-local fill-column 72)))



(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "HOLD(h)" "INACTIVE(i)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#9C6363" :weight bold)
              ("NEXT" :foreground "#8CD0D3" :weight bold)
              ("DONE" :foreground "#8FB28F" :weight bold)
              ("WAITING" :foreground "#DFAF8F" :weight bold)
              ("HOLD" :foreground "#DC8CC3" :weight bold)
              ("INACTIVE" :foreground "#DC8CC3" :weight bold)
              ("CANCELLED" :foreground "#8FB28F" :weight bold)
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
      (quote (("M" "3 Month" agenda "3 month view"
               ((org-agenda-span 90)))
              ("D" "Deadlines" agenda "Upcoming Deadlines over the next 3 months"
               ((org-agenda-span 90)
                (org-deadline-warning-days 90)
                (org-agenda-entry-types '(:deadline))))
              ("Y" "Holidays" agenda "Year view"
               ((org-agenda-category-filter-preset (quote ("+Holiday")))
                (org-agenda-span 'year)
                (org-agenda-time-grid nil)
                ))
              ("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("d" "Today"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile:")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-INACTIVE-HOLD-CANCELLED-ARCHIVE/!NEXT"
                           ((org-agenda-overriding-header "Next Tasks:"))))
               ((org-agenda-span 'day)))
              ("P" "Projects" tags "project"
               ((org-agenda-overriding-header "Projects")
                (org-tags-match-list-sublevels t)))
              )))


(setq org-agenda-exporter-settings
      '((ps-number-of-columns 2)
        (ps-landscape-mode t)
        (org-agenda-add-entry-text-maxlines 5)
        (htmlize-output-type 'css)))



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
     (emacs-lisp . t)
     (gnuplot . t)
     (haskell . t)
     (java . t)
     (js . t)
     (latex . t)
     (ledger . t)
     (octave . t)
     (perl . t)
     (python . t)
     (ruby . t)
     (scheme . t)
     (screen . nil)
     (,(if (locate-library "ob-sh") 'sh 'shell) . t)
     (ocaml . t)
     (sql . t)
     (sqlite . t))))

(defun org-babel-scheme-session-buffer (session)
  "Return the current session of SESSION otherwise nil."
  (org-babel-scheme-get-session-buffer session))

(defun org-babel-scheme-initiate-session (&optional session params)
  "Create a session named SESSION according to PARAMS."
  (let ((name (org-babel-scheme-make-session-name "" session 'guile)))
    (org-babel-scheme-set-session-buffer name (org-babel-scheme-get-repl
                                               'guile session))))



(defun kb/org-switch-to-notes ()
  "Switch to notes.
Open either current project notes, or default notes file"
  (interactive)
  (if (and (projectile-project-p)
           (not (equal (projectile-project-name) ".org")))
      (gf/org-switch-to-project-org-file)
    (kb/org-switch-to-current-notes-file)))



(defhydra help/hydra/timestamp (:hint nil :exit t)
  "
_ts_:  Inactive timestamp with seconds
_utc_: Ianctive timestamp with seconds in UTC
_d_:   Inactive date Local time
"
  ("q" exit)
  ("ts" help/org-time-stamp-with-seconds-now)
  ("utc" help/org-time-stamp-with-seconds-now-utc)
  ("d" help/org-date))

(defun help/org-time-stamp-with-seconds-now ()
  "Insert inactive Org timestamp with seconds."
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %a %H:%M:%S]")))

(defun help/org-time-stamp-with-seconds-now-utc ()
  "Insert inactive Org timestamp with seconds in UTC."
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %a %H:%M:%S]" nil t)))

(defun help/org-date ()
  "Insert inactive Org date."
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %a]")))

(define-key org-mode-map (kbd "C-c t") #'help/hydra/timestamp/body)



(defvar kb/org-id-ignored-filenames (list "README")
  "Base filenames to ignore when saving org files.")

(defun kb/org-id-get-create-all-items ()
  "Add ORG ID attributes to all tasks/items in the current buffer.
https://stackoverflow.com/a/13349772/7492588
https://stackoverflow.com/a/16247032/7492588"
  (interactive)
  (if (and (eq major-mode 'org-mode)
           (not (member (file-name-base (buffer-file-name)) kb/org-id-ignored-filenames)))
      (org-map-entries #'org-id-get-create)))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'kb/org-id-get-create-all-items)))




(use-package org-pomodoro)

(provide 'init-org)
;;; init-org.el ends here
