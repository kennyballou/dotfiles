;;; init-uniquify --- uniquify configuration
;;; Commentary:
;;; nicer naming of buffers for files with identitcal names
;;; Code:

(require 'uniquify)

(defvar uniquify-buff-ername-style)
(defvar uniquify-ignore-buffers-re)

(setq uniquify-buff-ername-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-uniquify)
;;; init-uniquify.el ends here
