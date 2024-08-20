;;; init-buf-mov --- configuration and setup of buffer-move
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(defvar buffer-move)

(use-package buffer-move
  :commands (buf-move-up buf-move-down buf-move-left buf-move-right)
  :bind (("C-x w p" . #'buf-move-up)
         ("C-x w n" . #'buf-move-down)
         ("C-x w a" . #'buf-move-left)
         ("C-x w e" . #'buf-move-right)))

(provide 'init-buf-mov)
;;; init-buf-mov.el ends here
