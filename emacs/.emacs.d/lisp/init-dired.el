;;; init-dired --- dired initialization and configuration
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(defvar dired)
(defvar dired-mode-map)

(use-package dired
  :ensure nil
  :init (require 'dired)
  :bind (:map dired-mode-map
         ("C-c C-c" . compile)
         ("r" . browse-url-of-dired-file))
  :config
  (setq dired-listing-switches "-lh"))

;; (use-package dired-column
;;   :ensure nil
;;   :after dired
;;   :bind (:map dired-mode-map
;;               ("o" . dired-column-find-file)))

;; (use-package dired-imenu
;;   :after dired)

;; (use-package dired-subtree
;;   :ensure nil
;;   :after dired
;;   :bind (:map dired-mode-map
;;               ("<tab>" . dired-subtree-toggle)
;;               ("<backtab>" . dired-subtree-cycle)))

;; (use-package dired-x
;;   :ensure nil
;;   :after dired
;;   :commands (dired-omit-mode dired-hide-details-mode)
;;   :hook ((dired-mode-hook . #'dired-omit-mode)
;;          (dired-mode-hook . #'dired-hide-details-mode))
;;   :bind (("s-\\" . dired-jump-other-window)
;;          :map dired-mode-map
;;          (")" . dired-omit-mode)))


;; http://pragmaticemacs.com/emacs/quickly-preview-images-and-other-files-with-peep-dired/
;; preview files in dired
(use-package peep-dired
  :pin "melpa-unstable"
  :ensure t
  :defer t
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(provide 'init-dired)
;;; init-dired.el ends here
