;;; init-dbus --- DBus custom handling
;;; Commentary:
;;; Code:

(require 'desktop)
(require 'dbus)

;; Loosely borrowed from https://github.com/jmibanez/jmi-dotemacs/blob/master/linux/000.init.el
;; Session handling -- Exit Emacs on D-BUS signal from session manager
(defun kb/dbus-handle-gnome-session-manager-exit ()
  "Perform some cleanup than shutdown Emacs server."
  (message "Closing session at request of DBus")
  (desktop-save (concat desktop-path desktop-base-file-name) t)
  (save-buffers-kill-emacs t))

(defvar kb/dbus-session-exit-handler "DBus Handler for Session Exits.")
(setq kb/dbus-session-exit-handler (dbus-register-signal
                                    :session
                                    "org.gnome.SessionManager"
                                    "/org/gnome/SessionManager"
                                    "org.gnome.SessionManager"
                                    "SessionOver"
                                    #'kb/dbus-handle-gnome-session-manager-ext))

(provide 'init-dbus)
;;; init-dbus.el ends here
