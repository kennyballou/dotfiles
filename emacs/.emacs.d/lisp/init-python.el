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
(defvar jedi)
(defvar ein)

(use-package python
  :init
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "--profile=emacs --simple-prompt")))

(use-package pip-requirements
  :after (python))

(use-package virtualenvwrapper
  :after (python)
  :init
  (setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))
  (setq venv-location (expand-file-name "~/.venvs")))

(use-package jedi
  :after python
  :defer t
  :hook ((python-mode . jedi-mode)))

(use-package ein
  :after (python)
  :defer t)

(provide 'init-python)
;;; init-python.el ends here
