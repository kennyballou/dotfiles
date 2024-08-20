;;; init-erlang --- erlang setup and configuration
;;; Commentary:
;;; Code:

(defvar erlang)
(defvar edts)
(use-package erlang
  :config
  (require 'erlang-start))
(use-package edts)

(provide 'init-erlang)
;;; init-erlang.el ends here
