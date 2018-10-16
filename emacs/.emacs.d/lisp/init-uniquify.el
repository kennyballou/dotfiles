;;; init-uniquify --- uniquify configuration
;;; Commentary:
;;; nicer naming of buffers for files with identitcal names
;;; Code:

(require 'uniquify)

(defvar uniquify-buffer-name-style)
(defvar uniquify-ignore-buffers-re)

(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

(provide 'init-uniquify)
;;; init-uniquify.el ends here
