;;; init-mpd --- mpdel emacs client configuration
;;; Commentary:
;;; Code:

(defvar mpdel)

(use-package mpdel
  :diminish mpdel-mode
  :init
  (setq libmpdel-hostname (format "/run/user/%d/mpd/socket" (user-uid)))
  :config
  (mpdel-mode))

(defhydra kb/hydra/mpdel (:hint nil :exit t)
  "
_SPC_:  Play/Pause                 _n_: next song      _U_: Update Database
_s_:    Stop Playback              _p_: previous song
_r_:    Randomize playback
_dr_:   Disable random playback
_R_:    Repeat placback
_dR_:   Disable repeat
"
  ("q" nil "cancel")
  ("SPC" libmpdel-playback-play-pause)
  ("s" libmpdel-stop)
  ("r" libmpdel-playback-set-random)
  ("dr" libmpdel-playback-unset-random)
  ("R" libmpdel-playback-set-repeat)
  ("dR" libmpdel-playback-unset-repeat)
  ("n" libmpdel-playback-next)
  ("p" libmpdel-playback-previous)
  ("U" libmpdel-database-update))

(define-key global-map (kbd "C-x Z h") #'kb/hydra/mpdel/body)


(provide 'init-mpd)
;;; init-mpd.el ends here
