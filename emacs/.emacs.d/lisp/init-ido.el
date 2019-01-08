;;; init-ido --- Maybe use ido
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; https://masteringemacs.org/article/introduction-to-ido-mode
;;; http://ergoemacs.org/emacs/emacs_ido_mode.html
;;; Code:

(defvar ido)
(defvar ido-vertical-mode)

(require 'ido)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)

(ido-mode 1)

(use-package ido-vertical-mode
  :init
  (ido-vertical-mode))

(provide 'init-ido)
;;; init-ido.el ends here
