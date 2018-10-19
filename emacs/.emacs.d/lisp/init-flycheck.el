;;; init-flycheck --- flycheck configuration
;;; Commentary:
;;; Code:

(defvar flycheck)
(defvar flycheck-color-mode-line)
(defvar flycheck-disabled-checkers)
(defvar flycheck-display-errors-function)

(use-package flycheck
  :defer 2
  :diminish
  :init (global-flycheck-mode)
  :config
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list)
  (add-to-list 'flycheck-disabled-checkers 'python-pylint)
  :custom
  (flycheck-display-errors-delay .3))

(use-package flycheck-color-mode-line
  :after flycheck
  :init (flycheck-color-mode-line-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
