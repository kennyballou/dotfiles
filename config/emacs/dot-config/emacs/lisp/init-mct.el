;;; init-mct --- minibuffer and completions in tandem
;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar mct)
(defvar mct-apply-completion-stripes)
(defvar mct-completion-blocklist)
(defvar mct-completion-passlist)
(defvar mct-completions-format)
(defvar mct-hide-completion-mode-line)
(defvar mct-live-update-delay)
(defvar mct-minimum-input)
(defvar mct-remove-shadowed-file-names)
(defvar mct-show-completion-line-numbers)

(use-package mct
  :config
  (setq mct-apply-completion-stripes t)
  (setq mct-completion-blocklist nil)
  (setq mct-completion-passlist
        '(imenu
          Info-goto-node
          Info-index
          Info-menu))
  (setq mct-completions-format 'one-column)
  (setq mct-hide-completion-mode-line nil)
  (setq mct-live-update-delay 0.6)
  (setq mct-minimum-input 3)
  (setq mct-remove-shadowed-file-names t)
  (setq mct-show-completion-line-numbers nil)
  :init
  (mct-mode 1))

(setq completion-styles
      '(basic substring initial flex partial-completion))
(setq completion-category-overrides
      '((file (styles . (basic partial-completion initials substring)))))

(setq completion-cycle-threshold 2)
(setq completion-ignore-case t)
(setq completion-show-inline-help nil)

(setq completions-detailed t)

(setq enable-recursive-minibuffers t)
(setq minibuffer-eldef-shorten-default t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq resize-mini-windows t)
(minibuffer-depth-indicate-mode 1)
(minibuffer-electric-default-mode 1)

(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible-mode t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(require 'savehist)
(setq savehist-file (locate-user-emacs-file "savehist"))
(setq history-length 10000)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history t)
(add-hook 'after-init-hook #'savehist-mode)

(provide 'init-mct)
;;; init-mct.el ends here
