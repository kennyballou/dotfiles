;;; init-erlang --- erlang setup and configuration
;;; Commentary:
;;; Code:

(ignore-errors
  (require-package 'erlang)
  (require-package 'edts))

(when (package-installed-p 'erlang)
  (require 'erlang-start))

(provide 'init-erlang)
;;; init-erlang.el ends here
