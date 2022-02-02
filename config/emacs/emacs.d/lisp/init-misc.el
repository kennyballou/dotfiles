;;; init-misc --- Miscellaneous Configuration
;;; Commentary:
;;; Misc config - yet to be placed in separate files
;;; Code:

(defvar f)
(defvar multiple-cursors)
(use-package f)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'prog-mode-hook 'goto-address-prog-mode)
(setq goto-address-mail-face 'link)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'after-save-hook 'sanityinc/set-mode-for-new-scripts)

(defun sanityinc/set-mode-for-new-scripts ()
  "Invoke `normal-mode' if this file is a script and in `fundamental-mode'."
  (and
   (eq major-mode 'fundamental-mode)
   (>= (buffer-size) 2)
   (save-restriction
     (widen)
     (string= "#!" (buffer-substring (point-min) (+ 2 (point-min)))))
   (normal-mode)))

(add-to-list 'auto-mode-alist '("Procfile" . 'conf-mode))

(use-package multiple-cursors)

(defun kb/init-window-split ()
  "Initialize automatic split thresholds for X."
  (interactive)
  (if (display-graphic-p)
    (progn
      (if (> (x-display-pixel-width) 1080)
          (setq split-height-threshold 160)
        (setq split-height-threshold 80)))))

(kb/init-window-split)

;; https://trey-jackson.blogspot.com/2010/04/emacs-tip-36-abort-minibuffer-when.html
(defun stop-using-minibuffer ()
  "Kill the minibuffer."
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook #'stop-using-minibuffer)

;; unset goal column
;; I don't really have a use for this
(unbind-key (kbd "C-x C-n") 'global-map)

;; advice
;; https://github.com/Fuco1/.emacs.d/blob/master/site-lisp/my-advices.el
;; from simple.el
(defadvice kill-line (before kill-line-autoreindent activate)
  "Kill excess whitespace when joining lines.
If the next line is joined to the current line, kill the extra indent whitespace in front of the next line."
  (when (and (eolp) (not (bolp)))
    (save-excursion
      (forward-char 1)
      (just-one-space 1))))

(provide 'init-misc)
;;; init-misc.el ends here
