;;; init-server --- daemon server configuration
;;; Commentary:
;;; Code:

;; https://www.emacswiki.org/emacs/EmacsAsDaemon
(defun signal-restart-server ()
  "Handler for SIGUSR1 signal, to (re)start an Emacs server.

Can be tested from within Emacs with:
  (signal-process (emacs-pid) 'sigusr1)

or from the command line with:
$ kill -USR1 <emacs-pid>
$ emacsclient -c"
  (interactive)
  (server-force-delete)
  (server-start))

(define-key special-event-map [sigusr1] 'signal-restart-server)

(provide 'init-server)
;;; init-server.el ends here
