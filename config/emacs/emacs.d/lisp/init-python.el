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
(defvar ein)
(defvar lsp-python-ms)

(use-package python
  :init
  (defun kb/python-mode ()
    (lsp-mode)
    (lsp-deferred))
  :hook (python-mode . kb/python-mode))

(use-package pip-requirements
  :after (python))

(use-package virtualenvwrapper
  :after (python)
  :init
  (setq venv-dirlookup-names '(".venv" "pyenv" ".virtual"))
  (setq venv-location (expand-file-name "~/.cache/venvs")))

(use-package ein
  :after (python))

(use-package lsp-python-ms
  :init
  (setq lsp-python-ms-executable (executable-find "python-language-server")))

(provide 'init-python)
;;; init-python.el ends here
