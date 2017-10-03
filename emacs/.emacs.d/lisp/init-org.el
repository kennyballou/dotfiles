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
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

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
