;;; init-yas --- yasnippets configuration
;;; Commentary:
;;; Code:

(defvar yasnippet)
(defvar yas-snippet-dirs)

(use-package yasnippet
  :diminish (yas-minor-mode)
  :config
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets")))

(provide 'init-yas)
;;; init-yas.el ends here
