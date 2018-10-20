;;; init-nix --- configuration and setup for nix
;;; Commentary:
;;; Code:

(defvar nix-buffer)
(defvar nix-mode)
(defvar nix-update)
(defvar nix-sandbox)

(use-package nix-mode)
(use-package nix-buffer)
(use-package nix-update
  :pin melpa-unstable)

(provide 'init-nix)
;;; init-nix.el ends here
