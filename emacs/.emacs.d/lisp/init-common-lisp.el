;;; init-common-lisp --- Common Lisp Configuration
;;; Commentary:
;;; Code:

(defvar slime)
(defvar slime-mode)
(defvar slime-protocol-version)
(defvar slime-net-coding-system)
(defvar slime-complete-symbol*-fancy)
(defvar slime-complete-symbol-function)
(defvar slime-lisp-implementations)
(defvar slime-repl-mode-map)
(defvar slime-company)
(defvar hippie-expand-slime)


(defun sanityinc/slime-setup ()
  "Mode setup function for slime Lisp buffers."
  (set-up-slime-hippie-expand))

(use-package slime
  :init
  (setq slime-protocol-version 'igore)
  (setq slime-net-coding-system 'utf-8-unix)
  (setq slime-complete-symbol*-fancy t)
  (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
  (add-hook 'slime-mode #'sanityinc/slime-setup)
  :config
  (use-package slime-company)
  (use-package hippie-expand-slime)
  (when (executable-find "sbcl")
    (add-to-list 'slime-lisp-implementations
                 '(sbcl ("sbcl") :coding-system utf-8-unix)))
  (when (executable-find "lisp")
    (add-to-list 'slime-lisp-implementations
                 '(cmucl ("lisp") :coding-system iso-latin-1-unix)))
  (when (executable-find "ccl")
    (add-to-list 'slime-lisp-implementations
                 '(ccl ("ccl") :coding-system utf-8-unix))))

(add-to-list 'auto-mode-alist '("\\.cl\\'" . 'lisp-mode))
(remove-hook 'lisp-mode-hook #'slime-lisp-mode-hook)
;; (add-hook 'lisp-mode-hook (lambda ()
;;                             (unless (featurep 'slime)
;;                               (require 'slime)
;;                               (normal-mode))))

;; Fromt http://bc.tech.coop/blog/070515.html
(defun lispdoc ()
  "Search lispdoc.com for SYMBOL.
By default, SYMBOL is the symbol currently under cursor."
  (interactive)
  (let* ((word-at-point (word-at-point))
         (symbol-at-point (symbol-at-point))
         (default (symbol-name symbol-at-point))
         (inp (read-from-minibuffer
               (if (or word-at-point symbol-at-point)
                   (concat "Symbol (default " default "): ")
                 "Symbol (no default): "))))
    (if (and (string= inp "") (not word-at-point) (not symbol-at-point))
        (message "you didn't enter a symbol!")
      (let ((search-type (read-from-minibuffer
                          "full-text (f) or basic (b) search (default b)? ")))
        (browse-url (concat "http://lispdoc.com?q="
                            (if (string inp "")
                                default
                              inp)
                            "&search="
                            (if (string-equal search-type "f")
                                "full+text+search"
                              "basic-search")))))))

(define-key lisp-mode-map (kbd "C-c l") 'lispdoc)


;;; REPL

(defun sanityinc/slime-repl-setup ()
  "Mode setup function for slime REPL."
  (sanityinc/lisp-setup)
  (set-up-slime-hippie-expand)
  (setq show-trailing-whitespace nil))

(with-eval-after-load 'slime-repl

  ;; Bind TAB to `indent-for-tab-command', as in regular Slime buffers.
  (define-key slime-repl-mode-map (kbd "TAB") 'indent-for-tab-command)

  (add-hook 'slime-repl-mode-hook 'sanityinc/slime-repl-setup))


(provide 'init-common-lisp)
;;; init-common-lisp.el ends here
