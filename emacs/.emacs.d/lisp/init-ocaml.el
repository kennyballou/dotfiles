;;; init-ocaml --- ocaml/tuareg configuration and seutp
;;; Commentary:
;;; Since tuareg is not yet in nixpkgs, clone to `site-lisp' directory.
;;; pushd ~/.emacs.d/site-lisp/ && git clone git://github.com/ocaml/tuareg.git
;;; Code:

(defvar tuareg)

(use-package tuareg
  :init
  (defun kb/ocaml-mode ()
    (lsp-mode)
    (lsp-deferred))
  :hook (tuareg-mode-hook . kb/ocaml-mode))

(provide 'init-ocaml)
;;; init-ocaml.el ends here
