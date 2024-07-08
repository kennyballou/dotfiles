;;; init-tags --- Tags configuration and setup
;;; Commentary:
;;; Code:

(defvar helm-gtags)
(defvar helm-gtags-auto-update)
(defvar helm-gtags-find-rtag)
(defvar helm-gtags-find-symbol)
(defvar helm-gtags-find-tag)
(defvar helm-gtags-ignore-case)
(defvar helm-gtags-next-history)
(defvar helm-gtags-parse-file)
(defvar helm-gtags-path-style)
(defvar helm-gtags-pop-stack)
(defvar helm-gtags-previous-history)

(use-package helm-gtags
  :diminish
  :after (helm)
  :commands (helm-gtags-find-tag
             helm-gtags-find-rtag
             helm-gtags-find-symbol
             helm-gtags-parse-file
             helm-gtags-previous-history
             helm-gtags-next-history
             helm-gtags-pop-stack)
  :hook (prog-mode . helm-gtags-mode)
  :init
  (setq helm-gtags-path-style 'relative
        helm-gtags-ignore-case t
        helm-gtags-auto-update t)
  :config
  (define-key helm-gtags-mode-map (kbd "M-t") #'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") #'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") #'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") #'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") #'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") #'helm-gtags-next-history))

(provide 'init-tags)
;;; init-tags.el ends here
