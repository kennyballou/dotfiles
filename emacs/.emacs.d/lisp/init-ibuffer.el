;;; init-ibuffer --- ibuffer configuration
;;; Commentary:
;;; Code:

(defvar ibuffer)
(defvar ibuffer-quit)
(defvar ibuffer-inline-columns)

(require-package 'fullframe)
(with-eval-after-load 'ibuffer
  (fullframe ibuffer ibuffer-quit))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
