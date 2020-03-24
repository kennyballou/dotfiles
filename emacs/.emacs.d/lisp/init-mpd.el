;;; init-mpd --- mpdel emacs client configuration
;;; Commentary:
;;; Code:

(defvar mpdel)

(use-package mpdel
  :diminish mpdel-mode
  :config
  (mpdel-mode))


(provide 'init-mpd)
;;; init-mpd.el ends here
