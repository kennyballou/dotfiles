;;; init-python --- configuration and setup for python
;;; Commentary:
;;; Code:

(defvar virtualenvwrapper)
(defvar venv-dirlookup-names)
(defvar venv-location)
(defvar python-shell-interpreter)
(defvar python-shell-interpreter-args)

(add-to-list 'auto-mode-alist '("SConstruct\\'" . 'python-mode))
(add-to-list 'auto-mode-alist '("SConscript\\'" . 'python-mode))

(require-package 'pip-requirements)
(use-package virtualenvwrapper
  :ensure t
  :init
  (setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))
  (setq venv-location (expand-file-name "~/.venvs"))
  :config

  (venv-initialize-interactive-shells)

  )

(when (maybe-require-package 'anaconda-mode)
  (with-eval-after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)))

(defvar flycheck-disabled-checkers)

(when (maybe-require-package 'flycheck)
  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'python-pylint)
    (add-hook 'python-mode-hook
              (lambda () (flycheck-select-checker 'python-flake8)))))

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--profile=emacs"))

(provide 'init-python)
;;; init-python.el ends here
