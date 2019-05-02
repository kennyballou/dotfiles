;;; init-ibuffer --- ibuffer configuration
;;; Commentary:
;;; Code:

(defvar ibuffer)
(defvar ibuffer-quit)

(use-package ibuffer
  :config
  (fullframe ibuffer ibuffer-quit))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
