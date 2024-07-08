;;; init-windows --- Emacs Window configuration
;;; Commentary:
;;;
;;; Partially taken from:
;;; https://github.com/purcell/emacs.d/blob/b2aea30bff7ca4bbb62f579ca7e3ff0e895a7911/lisp/init-windows.el
;;; This is not about the "Windows" OS, but rather Emacs's "windows"
;;; concept: these are the panels within an Emacs frame which contain
;;; buffers.
;;;
;;; Code:

(defvar switch-window)
(defvar switch-window-shortcut-style)
(defvar switch-window-timeout)


(use-package switch-window
  :commands switch-window
  :config
  (setq switch-window-shortcut-style 'alphabet)
  (setq switch-window-timeout nil)
  :init
  (global-set-key (kbd "C-x o") #'switch-window))

(provide 'init-windows)
;;; init-windows.el ends here
