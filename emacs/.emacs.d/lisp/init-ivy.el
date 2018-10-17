;;; init-ivy --- Maybe use ivy
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar ivy-mode)
(defvar projectile-completion-system)
(defvar magit-completing-read-function)
(defvar dumb-jump-selector)
(defvar rtags-display-result-backend)

(use-package ivy
  :commands ivy-mode
  :init
  (require 'ivy nil t)
  (setq-default ivy-use-virtual-buffers t
                ivy-virtual-abbreviate 'fullpath
                ivy-count-format "%d/%d: "
                ivy-initial-inputs-alist)
  (setq projectile-completion-system 'ivy
        magit-completing-read-function 'ivy-completing-read
        dumb-jump-selector 'ivy
        rtags-display-result-backend 'ivy)
  :config (ivy-mode 1)
  :hook (after-init-hook . ivy-mode)
  :delight)

(use-package counsel
  :delight
  :init
  (setq-default consul-mode-override-describe-bindings t))

(use-package swiper
  :functions sanityinc/swiper-at-point
  :bind (("M-s /" . #'sanityinc/swiper-at-point))
  :init
  (defun sanityinc/swiper-at-point (sym)
    "Use `swiper' to search for a the symbol at point."
    (interactive (list (thing-at-point 'symbol)))
    (swiper sym)))

(provide 'init-ivy)
;;; init-ivy.el ends here
