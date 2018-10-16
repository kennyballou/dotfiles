;;; init-use-package --- use-package global configuration
;;; Commentary:
;;; Code:

(defvar use-package-always-ensure)
(defvar use-package-always-pin)

;;; Bootstrap use-package
;;; Install use-package if it's not already installed.
;;; use-package is used to configure the rest of packages.
;;; https://caolan.org/dotfiles/emacs.html
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-pin "melpa-stable")

(use-package bind-key)
(use-package delight
  :pin gnu)
(use-package diminish)

(provide 'init-use-package)
;;; init-use-package.el ends here
