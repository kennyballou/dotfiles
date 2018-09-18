;;; init-mmm --- Multimajor mode configuration
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(defvar mmm-mode)
(defvar mmm-auto)
(defvar mmm-global-mode)
(defvar mmm-submode-decoration-level)

(use-package mmm-mode
  :pin gnu
  :commands mmm-mode
  :config
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)
  (use-package mmm-auto
    :ensure nil
    :demand))

(provide 'init-mmm)
;;; init-mmm.el ends here
