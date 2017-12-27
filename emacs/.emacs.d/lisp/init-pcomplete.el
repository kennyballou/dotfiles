;;; init-pcomplete -- pcomplete configuration
;;; Commentary:
;;; Code:

;; Git Commands
;; https://www.masteringemacs.org/article/pcomplete-context-sensitive-completion-emacs
(defconst pcmpl-git-commands
  '("add" "bisect" "branch" "checkout" "clone" "commit"
    "diff" "fetch" "grep" "init" "log" "merge" "mv" "pull"
    "push" "rebase" "reset" "rm" "show" "status" "tag")
  "List of `git' commands.")

(defvar pcmpl-git-ref-list-cmd "git for-each-ref refs/ --format='%(refname)'"
  "The `git' command to run to get a list of refs.")

(defun pcmpl-git-get-refs (type)
  "Return a list of `git' refs filtered by TYPE."
  (with-temp-buffer
    (insert (shell-command-to-string pcmpl-git-ref-list-cmd))
    (goto-char (point-min))
    (let ((ref-list))
      (while (re-search-forward (concat "^refs/" type "/\\(.+\\)$") nil t)
        (add-to-list 'ref-list (match-string 1)))
      ref-list)))

(defun pcomplete/git ()
  "Completion for `git'."
  ;; Completion for the command argument.
  (pcomplete-here* pcmpl-git-commands)
  (cond
  ;; complete files/directories forever if the command is `add' or `rm'.
  ((pcomplete-match (regexp-opt '("add" "rm")) 1)
   (while (pcomplete-here (pcomplete-entries))))
  ;; provide branch completion for the command `checkout'.
  ((pcomplete-match "checkout" 1)
   (pcomplete-here* (pcmpl-git-get-refs "heads")))))


(provide 'init-pcomplete)
;;; init-pcomplete.el ends here
