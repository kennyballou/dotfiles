;;; init-ivy --- Maybe use ivy
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'ivy)
  (add-hook 'after-init-hook 'ivy-mode)
  (with-eval-after-load 'ivy
    (setq-default ivy-use-virtual-buffers t
                  ivy-virtual-abbreviate 'fullpath
                  ivy-count-format "%d/%d: "
                  projectile-completion-system 'ivy
                  ivy-initial-inputs-alist)
    (when (maybe-require-package 'delight)
      (delight 'ivy-mode nil 'ivy))))


(when (maybe-require-package 'counsel)
  (setq-default counsel-mode-override-describe-bindings t)
  (when (maybe-require-package 'delight)
      (delight 'counsel-mode nil 'counsel))
  (add-hook 'after-init-hook 'counsel-mode)

  (when (maybe-require-package 'swiper)
    (with-eval-after-load 'ivy
      (defun sanityinc/swiper-at-point (sym)
        "Use `swiper' to search for a the symbol at point."
        (interactive (list (thing-at-point 'symbol)))
        (swiper sym))
      (global-set-key (kbd "M-s /") 'sanityinc/swiper-at-point))))

(provide 'init-ivy)
