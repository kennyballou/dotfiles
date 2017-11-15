;;; init-spelling --- Spelling Configuration
;;; Commentary:
;;; Code:

(defvar ispell)
(use-package ispell
  :ensure t
  :init
  (add-hook 'text-mode-hook (lambda () (flyspell-mode t)))
  :config

  (when (executable-find ispell-program-name)
    (require 'init-flyspell)))



(provide 'init-spelling)
;;; init-spelling.el ends here
