;;; init-elfeed --- Elfeed setup and configuration
;;; Commentary:
;;; Code:

(defvar elfeed)
(defvar elfeed-org)
(defvar rmh-elfeed-org-files)

(use-package elfeed)

(use-package elfeed-org
  :after elfeed
  :config
  (setq rmh-elfeed-org-files (list "~/.org/elfeed.org"))
  (elfeed-org))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
