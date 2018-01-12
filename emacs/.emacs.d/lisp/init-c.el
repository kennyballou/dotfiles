;;; init-c --- C/C++ configuration
;;; Commentary:
;;; Code:

(defvar c-default-style)
(setq c-default-style `((java-mode . "java")
                        (awk-mode . "awk")
                        (c-mode . "linux")
                        (other . "gnu")))

(add-hook 'c-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 8)))

(provide 'init-c)
;;; init-c.el ends here
