;;; init-eshell --- EShell configuration
;;; Commentary:
;;; Code:

(require 'eshell)

(defvar eshell-prompt-function)
(defvar eshell-highlight-prompt)

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

;;; https://www.emacswiki.org/emacs/EshellPrompt
(defmacro with-face (str &rest properties)
  "Add face properties to STR using PROPERTIES list."
  `(propertize ,str 'face (list ,@properties)))


(defun kb-eshell-prompt ()
  "Modified version of `shk-eshell-prompt-function' from Emacs wiki."
  (concat
   "(@"
   (system-name)
   ")("
   (eshell/pwd)
   ")"
   (if (ignore-errors (vc-responsible-backend default-directory))
       (concat "["
               (car (vc-git-branches))
               "] ± ")
     "% ")
   ))

(setq eshell-prompt-function #'kb-eshell-prompt)
(setq eshell-highlight-prompt nil)

(provide 'init-eshell)
;;; init-eshell.el ends here
