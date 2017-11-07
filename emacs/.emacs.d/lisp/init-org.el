;;; init-org --- Org mode configurations
;;; Commentary:
;;; Started from purcell:
;;; https://github.com/purcell/emacs.d/blob/master/lisp/init-org.el
;;; Various inclusions from glynnforrest:
;;; https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-org.el
;;;
;;; Code:

(maybe-require-package 'org-cliplink)
(require-package 'ob-elixir)
(require-package 'ob-go)
(require-package 'ob-ipython)
(require-package 'ob-mongo)

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
      org-refile-targets '((nil :maxlevel . 2)))

(setq org-capture-templates
      `(("t" "todo" entry (file "") ; "" => `org-default-notes-file'
         "* NEXT %?\n%U\n" :clock-resume t)
        ("n" "note" entry (file "")
         "* %? :NOTE:\n%U\n%a\n" :clock-resume t)
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
  (setq gf/current-month-notes-last-visited nil)
  (setq org-files (append
                   (file-expand-wildcards (concat org-directory "*/*.org"))
                   (file-expand-wildcards (concat org-directory "*/*/*.org"))))

  ;; Notes are grouped by month in ~dates/~ for automatic archival.
  ;; At the start of every month, move over notes that are still relevant.
  ;; Agenda files are only used for searching - this setup is
  ;; desiged to work without scheduling, tags etc.
  (setq org-agenda-files
        (append
         (file-expand-wildcards (concat org-directory "dates/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*.org"))
         (file-expand-wildcards (concat org-directory "topics/*/*.org"))))
  (setq org-default-notes-file (gf/org-current-month-notes-file)))

(defun gf/org-current-month-notes-file ()
  "Get the path of the org file for the current month."
  (concat org-directory "dates/"
          (format-time-string "%Y-%m.org")))

(defun gf/org-refile-files-first ()
  "Choose an org file to file in, then pick the node.
This prevents Emacs opening all of the refile targets at once."
  (interactive)
  (let ((file (list (completing-read "Refile to: " org-files nil t))))
    (let ((org-refile-targets `((,file :maxlevel . 1))))
      (org-refile)))
  (org-save-all-org-buffers))

(defun gf/commit-notes ()
  "Commit all org files to git with the current date and time.
New files must be explicitly added-- this prevents accidental
committing of junk files."
  (interactive)
  (let ((old-dir default-directory))
    (cd org-directory)
    (shell-command (concat
                    "git commit -am \""
                    (format-time-string "%a %e %b $H:%M:%S\"")))
    (cd old-dir)))

(defvar gf/current-month-notes-last visited nil
  "The last date the org file for the current month was opened.")

(defun gf/find-current-month-notes-file ()
  "Find the org file for the current month"
  (interactive)
  (setq gf/current-month-last-visited (format-time-string "%D"))
  (find-file org-default-notes-file))

(defun gf/check-current-month-notes-reminder ()
  "Show a reminder message if the current notes file hasn't been visited today."
  (if (not (equal gf/current-month-notes-last visited
                  (format-time-string "%D")))
      (message (format "Check your notes for today, %a"
                       (format-time-string "%A %e of $B")))))

(add-hook 'find-file-hook #'gf/check-current-month-notes-Nreminder)

(defun gf/org-end-of-section ()
  "Move to the last line of the current section."
  (interactive)
  (re-search-backward "^\* ")
  (org-forward-element 1)
  (previous-line 1))

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

(provide 'init-org)
;;; init-org.el ends here
