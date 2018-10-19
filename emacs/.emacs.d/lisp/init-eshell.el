;;; init-eshell --- EShell configuration
;;; Commentary:
;;; Code:

(require 'eshell)
(require 'em-term)

(defvar eshell-prompt-function)
(defvar eshell-highlight-prompt)
(defvar eshell-history-size)
(defvar eshell-prompt-regexp)
(defvar eshell-banner-message)
(defvar eshell-visual-commands)
(defvar eshell-visual-options)
(defvar eshell-visual-subcommands)
(defvar slime-mode)


(setq eshell-banner-message "\n\n")

;;; https://www.emacswiki.org/emacs/EshellFunctions#toc2
(defun eshell/emacs (&rest args)
  "Open a file or files, ARGS, in Emacs.  Some habits die hard."
  (if (null args)
      ;; If I just ran "emacs", I probably expect to be launching
      ;; Emacs, which is rather silly since I'm already in Emacs.
      ;; So just pretend to do what I ask.
      (bury-buffer)
    ;; We have to expand the file names or else naming a directory in an
    ;; argument causes later arguments to be looked for in that directory,
    ;; not the starting directory
    (mapc #'find-file (mapcar
                       #'expand-file-name
                       (eshell-flatten-list (reverse args))))))

(defun eshell/valgrind (&rest args)
  "Open valgrind with ARGS process into compiling output buffer."
  (let ((command (concat "valgrind" " " (string-join args " "))))
    (if (and (eshell-interactive-output-p)
             (not eshell-in-pipeline-p)
             (not eshell-in-subcommand-p))
        (compile command)
      (compile command t))))

;;; https://www.emacswiki.org/emacs/EshellPrompt
(defmacro with-face (str &rest properties)
  "Add face properties to STR using PROPERTIES list."
  `(propertize ,str 'face (list ,@properties)))

(defun shortened-path (path max-len)
  "Return a modified version of PATH up to MAX-LEN.
Replace some components with single characters starting from the
left to try and get the PATH down to, at most, MAX-LEN."
  (let* ((components (split-string (abbreviate-file-name path)
                                   (f-path-separator)))
         (len (+ (1- (length components))
                 (reduce '+ components :key 'length)))
         (str ""))
    (while (and (> len max-len)
                (cdr components))
      (setq str (concat str (if (= 0 (length (car components)))
                                (f-path-separator)
                              (string (elt (car components) 0) ?/)))
            len (- len (1- (length (car components))))
            components (cdr components)))
    (concat str (reduce
                 (lambda (a b) (concat a (f-path-separator) b)) components))))

(defun kb-eshell-prompt ()
  "Modified version of `shk-eshell-prompt-function' from Emacs wiki."
  (defun git-changes-symbol ()
    "Return git change symbol if changes."
    (let ((status (string-to-number
                   (shell-command-to-string
                    "git status --porcelain 2> /dev/null | wc -l"))))
      (if (> status 0)
          (concat "(" (with-face "ϟ" :foreground "#7F9F7F") ")")
        "")))
  (defun git-branch-name ()
    "Return the current git branch, or 'root' if nil."
    (let ((branch (vc-git-branches)))
      (if (not branch)
          (car branch)
        "(root new-repo)")))
  (concat
   "(@"
   (system-name)
   ")("
   (shortened-path (eshell/pwd) 20)
   ")"
   (if (ignore-errors (vc-responsible-backend default-directory))
       (concat "["
               (with-face (git-branch-name) :foreground "#9D6D8E")
               (git-changes-symbol)
               "]± ")
     "% ")
   ))

(setq eshell-prompt-function #'kb-eshell-prompt)
(setq eshell-highlight-prompt nil)
(setq eshell-history-size 4096)
(setq eshell-prompt-regexp "(.*)(.*)\\(\\[.*\\]\\)?[%±] ")
(dolist (cmd '("vim"
               "yarn"
               "composer"
               "pip"
               "qemu-system-x86_64"))
  (add-to-list 'eshell-visual-commands cmd))
(dolist (subcmd '(("git" "log" "diff" "show" "help")
                  ("docker" "build" "run" "exec" "logs")
                  ("make" "nconfig" "menuconfig" "dev-run" "run")
                  ("mix" "test")))
  (add-to-list 'eshell-visual-subcommands subcmd))

(setenv "PAGER" "")

;; disable slime in eshell
(add-hook 'eshell-mode-hook
          (lambda () (setq slime-mode nil)))

(provide 'init-eshell)
;;; init-eshell.el ends here
