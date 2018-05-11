;;; init-python --- configuration and setup for python
;;; Commentary:
;;; Code:

(defvar python)
(defvar virtualenvwrapper)
(defvar venv-dirlookup-names)
(defvar venv-location)
(defvar pip-requirements)
(defvar python-shell-interpreter)
(defvar python-shell-interpreter-args)
(defvar flycheck-disabled-checkers)
(defvar anaconda-mode)
(defvar anaconda-eldoc-mode)

(use-package python
  :init
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--profile=emacs --simple-prompt"))
  :config
  (use-package pip-requirements)
  (use-package virtualenvwrapper
    :ensure t
    :init
    (setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))
    (setq venv-location (expand-file-name "~/.venvs"))
    :config

    (venv-initialize-interactive-shells)

    )
  )

(use-package anaconda-mode
  :after python
  :hook ((python-mode . anaconda-mode)
         (python-mode . anaconda-eldoc-mode)))

(when (maybe-require-package 'flycheck)
  (with-eval-after-load 'flycheck
    (add-to-list 'flycheck-disabled-checkers 'python-pylint)
    (add-hook 'python-mode-hook
              (lambda () (flycheck-select-checker 'python-flake8)))))

(provide 'init-python)
;;; init-python.el ends here
