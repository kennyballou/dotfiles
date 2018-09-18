;;; init-rainbow --- Rainbow mode configuration
;;; Commentary:
;;; Code:

(defvar rainbow-mode)
(defvar rainbow-delimiters)

(use-package rainbow-mode
  :pin gnu)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-rainbow)
;;; init-rainbow.el ends here
