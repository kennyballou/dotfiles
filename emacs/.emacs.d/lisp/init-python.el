;;; init-python --- configuration and setup for python
;;; Commentary:
;;; Code:

(defvar virtualenvwrapper)
(defvar venv-dirlookup-names)

(add-to-list 'auto-mode-alist '("SConstruct\\'" . 'python-mode))
(add-to-list 'auto-mode-alist '("SConscript\\'" . 'python-mode))

(require-package 'pip-requirements)
(use-package virtualenvwrapper
  :ensure t
  :config

  (setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))

  ;;(venv-initialize-interactive-shell)

  )

(when (maybe-require-package 'anaconda-mode)
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (with-eval-after-load 'company
      (add-hook
       'python-mode-hook
       (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

(defvar flycheck-disabled-checkers)

(when (maybe-require-package 'flycheck)
  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'python-pylint)
    (add-hook 'python-mode-hook
              (lambda () (flycheck-select-checker 'python-flake8)))))

(provide 'init-python)
;;; init-python.el ends here
