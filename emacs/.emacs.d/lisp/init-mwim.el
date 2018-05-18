;;; init-mwim -- mwim configuration
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(use-package mwim
  :bind (([remap move-beginning-of-line] . mwim-beginning-of-code-or-line)
         ([remap move-end-of-line] . mwim-end-of-code-or-line)))

(provide 'init-mwim)
;;; init-mwim.el ends here
