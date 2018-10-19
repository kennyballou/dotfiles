;;; init-spelling --- Spelling Configuration
;;; Commentary:
;;; Code:

(defvar ispell)
(defvar ispell-program-name)

(use-package ispell
  :ensure t
  :hook ((text-mode-hook . (lambda () flyspell-mode t))))

(provide 'init-spelling)
;;; init-spelling.el ends here
