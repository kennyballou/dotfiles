;;; init-buf-mov --- configuration and setup of buffer-move
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(defvar buffer-move)

(use-package buffer-move
  :bind
  (("<M-S-up>" . buf-move-up)
   ("<M-S-down>" . buf-move-down)
   ("<M-S-left>" . buf-move-left)
   ("<M-S-right>" . buf-move-right)))

(provide 'init-buf-mov)
;;; init-buf-mov.el ends here
