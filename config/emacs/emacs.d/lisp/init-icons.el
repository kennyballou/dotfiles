;;; init-icons --- all-the-icons for emacs
;;; Commentary:
;;; Code:

(defvar all-the-icons)
(defvar all-the-icons-dired)
(defvar all-the-icons-ibuffer)

(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package all-the-icons-ibuffer
  :after all-the-icons
  :hook (ibuffer-mode . all-the-icons-ibuffer-mode))


(provide 'init-icons)
;;; init-icons.el ends here
