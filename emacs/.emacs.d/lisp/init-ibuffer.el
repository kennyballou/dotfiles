;;; init-ibuffer --- ibuffer configuration
;;; Commentary:
;;; Code:

(defvar fullframe)
(defvar ibuffer)
(defvar ibuffer-quit)
(defvar ibuffer-inline-columns)

(use-package fullframe)
(use-package ibuffer
  :ensure nil
  :after fullframe
  :config
  (fullframe ibuffer ibuffer-quit))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
