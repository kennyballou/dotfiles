;;; init-spelling --- Spelling Configuration
;;; Commentary:
;;; Code:

(defvar ispell)
(defvar ispell-extra-args)

(use-package ispell
  :config
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together")))

(provide 'init-spelling)
;;; init-spelling.el ends here
