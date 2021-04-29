;;; init-z3 --- z3 prover mode
;;; Commentary:
;;; Code:

(defvar z3-mode)
(defvar z3-solver-cmd)

(use-package z3-mode
  :mode "\\.smt2\\'"
  :config
  (setq z3-solver-cmd "z3"))

(provide 'init-z3)
;;; init-z3.el ends here
