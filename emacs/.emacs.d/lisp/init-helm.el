;;; init-helm --- Maybe use helm
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; https://tuhdo.github.io/helm-intro.html
;;; Code:

(defvar helm)
(defvar helm-map)
(defvar helm-mode)
(defvar helm-config)
(defvar helm-descbinds)
(defvar helm-apropos-fuzzy-match)
(defvar helm-autoresize-max-height)
(defvar helm-autoresize-min-height)
(defvar helm-buffers-fuzzy-matching)
(defvar helm-echo-input-in-header-line)
(defvar helm-ff-file-name-history-use-recentf)
(defvar helm-ff-search-library-in-sexp)
(defvar helm-grep-default-command)
(defvar helm-grep-default-recurse-command)
(defvar helm-imenu-fuzzy-match)
(defvar helm-lisp-fuzzy-completion)
(defvar helm-locate-fuzzy-match)
(defvar helm-M-x-fuzzy-match)
(defvar helm-recentf-fuzzy-match)
(defvar helm-semantic-fuzzy-match)
(defvar helm-sources-using-default-as-input)
(defvar swiper-helm)


(use-package helm
  :config
  (delight 'helm-mode))

(use-package helm-config
  :diminish)

(use-package helm-descbinds
  :after (helm helm-config)
  :config
  (helm-descbinds-mode))

(use-package swiper-helm
  :after helm
  :bind (("C-s" . swiper-helm)))

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h".  Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

;; rebind tab to run persistent action
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
;; make TAB work in terminal
(define-key helm-map (kbd "C-i") #'helm-execute-persistent-action)
;; list actions using C-z
(define-key helm-map (kbd "C-z") #'helm-select-action)
;; Default to helm-M-x
(global-set-key (kbd "M-x") #'helm-M-x)
;; helm show kill ring
(global-set-key (kbd "M-y") #'helm-show-kill-ring)
;; use helm-mini
(global-set-key (kbd "C-x b") #'helm-mini)
;; use helm-find-files
(global-set-key (kbd "C-x C-f") #'helm-find-files)
;; "better" binding for all mark rings
(global-set-key (kbd "C-h SPC") #'helm-all-mark-rings)
;; more "convenient" keybinding for helm-occur
(global-set-key (kbd "C-c h o") #'helm-occur)
;; helm mini buffer history
(define-key minibuffer-local-map (kbd "C-c C-l") #'helm-minibuffer-history)


(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook
          #'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(setq helm-apropos-fuzzy-match t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-lisp-fuzzy-completion t)
(setq helm-locate-fuzzy-match t)
(setq helm-semantic-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)
(setq helm-ff-search-library-in-sexp t)
(setq helm-ff-file-name-history-use-recentf t)
(helm-autoresize-mode t)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(helm-mode t)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(provide 'init-helm)
;;; init-helm.el ends here
