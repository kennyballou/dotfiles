;;; init-erlang --- erlang setup and configuration
;;; Commentary:
;;; Code:

(defun kb/erlang-config ()
  "Configure Erlang and EDTS modes."
  (require 'erlang-start))

(defvar erlang)
(defvar edts)
(use-package erlang
  :config (kb/erlang-config))
(use-package edts)

(provide 'init-erlang)
;;; init-erlang.el ends here
