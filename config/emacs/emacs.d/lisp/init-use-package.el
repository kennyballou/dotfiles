;;; init-use-package --- use-package global configuration
;;; Commentary:
;;; Code:

(defvar use-package-always-ensure)
(defvar use-package-always-pin)

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure nil)

(use-package bind-key)
(use-package diminish)

(provide 'init-use-package)
;;; init-use-package.el ends here
