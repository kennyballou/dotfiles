(require-package 'paredit)
(autoload 'enable-paredit-mode "paredit")

(defun maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'maybe-map-paredit-newline)

(after-load 'paredit
            (diminish 'paredit-mode " Par")
            ;; Suppress certain paredit keybindings to avoid clashes, including
            ;; my global binding of M-?
            (dolist (binding '("C-<left>" "C-<right>" "C-M-<left>" "C-M-<right>" "M-s" "M-?"))
              (define-key paredit-mode-map (read-kbd-macro binding) nil)))

;; Compatibility with other modes
(suspend-mode-during-cua-rect-selection 'paredit-mode)

;; Use present in the minibuffer
;; TODO: break out into separate package
;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
(add-hook 'minibuffer-setup-hook 'conditionally-enabled-paredit-mode)

(defvar conditionally-enabled-paredit-mode ()
  "Enabled paredit during lisp-related minibuffer-commands."
  (if (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))

;; Enable some handy paredit functions in all prog modes

(require-package 'paredit-everywhere)
(after-load 'paredit-everywhere
            (define-key paredit-everywhere-mode-map (kbd "M-s") nil))
(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(add-hook 'css-mode-hook 'paredit-everywhere-mode)

(provide 'init-paredit)
