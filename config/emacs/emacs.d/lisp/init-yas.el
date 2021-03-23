;;; init-yas --- yasnippets configuration
;;; Commentary:
;;; Code:

(defvar yasnippet)
(defvar yas-snippet-dirs)

(use-package yasnippet
  :diminish (yas-minor-mode)
  :hook ((prog-mode LaTeX-mode org-mode) . yas-minor-mode)
  :config
  (setq yas-snippet-dirs
        (list (expand-file-name "snippets" user-emacs-directory)))
  (yas-reload-all))

(provide 'init-yas)
;;; init-yas.el ends here
