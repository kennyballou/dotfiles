;;; init-flycheck --- flycheck configuration
;;; Commentary:
;;; Code:

(defvar flycheck)
(defvar flycheck-color-mode-line)
(defvar flycheck-disabled-checkers)
(defvar flycheck-display-errors-function)
(defvar helm-flycheck)

(use-package flycheck
  :defer 2
  :diminish
  :hook (after-init . global-flycheck-mode)
  :commands flycheck-add-mode
  :config
  (setq flycheck-global-modes
        '(not outline-mode diff-mode shell-mode eshell-mode term-mode))
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-indication-mode (if (display-graphic-p) 'left-fringe 'left-margin))
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list)
  (add-to-list 'flycheck-disabled-checkers 'python-pylint)
  (setq flycheck-display-errors-delay .3))

(use-package flycheck-posframe
  :after flycheck
  ;;:if (display-graphic-p)
  :hook (flycheck-mode . flycheck-posframe-mode)
  :config
  (setq flycheck-posframe-border-width 4)
  (setq flycheck-posframe-inhibit-functions
        '((lambda (&rest _) (bound-and-true-p company-backend)))))

(use-package flycheck-pos-tip
  :after flycheck
  ;;:if (display-graphic-p)
  :defines flycheck-pos-tip-timeout
  :hook (flycheck-mode . flycheck-pos-tip-mode)
  :config
  (setq flycheck-pos-tip-timeout 30))

(use-package flycheck-popup-tip
  :after flycheck
  ;;:if (display-graphic-p)
  :hook (flycheck-mode . flycheck-popup-tip-mode))
  (dolist (mode '(gfm-mode
                  latex-mode
                  markdown-mode
                  message-mode
                  org-mode
                  tex-mode
                  text-mode))
    (flycheck-add-mode 'proselint mode))

(use-package flycheck-color-mode-line
  :after flycheck
  :init (flycheck-color-mode-line-mode))

(use-package helm-flycheck
  :after (helm flycheck))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
