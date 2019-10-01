;;; init-ibuffer --- ibuffer configuration
;;; Commentary:
;;; Code:

(defvar ibuffer)
(defvar ibuffer-vc)
(defvar ibuffer-quit)
(defvar ibuffer-vc-set-filter-groups-by-vc-root)
(defvar ibuffer-sorting-mode)

(use-package ibuffer
  :config
  (fullframe ibuffer ibuffer-quit))

(use-package ibuffer-vc
  :after (ibuffer)
  :config
  (defun ibuffer-set-up-preferred-filters ()
    "Setup ibuffer sorting and filtering."
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'filename/process)
      (ibuffer-do-sort-by-filename/process)))
  (add-hook 'ibuffer-hook #'ibuffer-set-up-preferred-filters))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
