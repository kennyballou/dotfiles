;;; init-ivy --- Maybe use ivy
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; https://truthseekers.io/lessons/how-to-use-ivy-swiper-counsel-in-emacs-for-noobs/
;;; https://github.com/abo-abo/swiper
;;; https://github.com/purcell/emacs.d/blob/b2aea30/lisp/init-ivy.el
;;; Code:

(defvar ivy)
(defvar ivy-mode)
(defvar swiper)
(defvar counsel)
(defvar projectile-completion-system)
(defvar magit-completing-read-function)
(defvar dumb-jump-selector)
(defvar rtags-display-result-backend)
(defvar ivy-use-virtual-buffers)
(defvar ivy-virtual-abbreviate)
(defvar ivy-count-format)
(defvar ivy-initial-inputs-alist)
(defvar counsel-mode-override-describe-bindings)

(use-package ivy
  :diminish)
(use-package swiper
  :diminish)
(use-package counsel
  :diminish)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-virtual-abbreviate 'fullpath)
(setq ivy-count-format "%d/%d: ")
(setq ivy-initial-inputs-alist nil)
(setq counsel-mode-override-describe-bindings t)

(defun sanityinc/swiper-at-point (sym)
  "Use `swiper' to search for a the symbol SYM at point."
  (interactive (list (thing-at-point 'symbol)))
  (swiper sym))

(global-set-key (kbd "M-x") #'counsel-M-x)
(global-set-key (kbd "C-s") #'swiper)
(global-set-key (kbd "M-s /") #'sanityinc/swiper-at-point)
(global-set-key (kbd "C-x C-f") #'counsel-find-file)
(global-set-key (kbd "C-h f") #'counsel-describe-function)
(global-set-key (kbd "C-h v") #'counsel-describe-variable)
(global-set-key (kbd "C-c C-r") #'ivy-resume)

(global-set-key (kbd "C-c g") #'counsel-git-grep)
(global-set-key (kbd "C-c l") #'counsel-locate)


(provide 'init-ivy)
;;; init-ivy.el ends here
