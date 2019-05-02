;;; init-dired --- dired initialization and configuration
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(defvar dired)
(defvar dired-mode-map)

(use-package dired
  :init (require 'dired)
  :bind (:map dired-mode-map
         ("C-c C-c" . compile)
         ("r" . browse-url-of-dired-file))
  :config
  (setq dired-listing-switches "-lh"))

;; http://pragmaticemacs.com/emacs/quickly-preview-images-and-other-files-with-peep-dired/
;; preview files in dired
(use-package peep-dired
  :defer t
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(provide 'init-dired)
;;; init-dired.el ends here
