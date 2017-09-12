;; nicer naming of buffers for files with identitcal names

(require 'uniquify)

(setq uniquify-buff-ername-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ingore-buffers-re "^\\*")

(provide 'init-uniquify)
