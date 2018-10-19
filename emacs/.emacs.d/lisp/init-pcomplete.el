;;; init-pcomplete -- pcomplete configuration
;;; Commentary:
;;; Code:

(defvar pcmpl-args)
(defvar pcmpl-git)
(defvar pcmpl-pip)
(defvar pcomplete-extension)
(defvar melpa-unstable)
(use-package pcmpl-args
  :pin melpa-unstable)
(use-package pcmpl-git
  :pin melpa-unstable)
(use-package pcmpl-pip
  :pin melpa-unstable)
(use-package pcomplete-extension)


(provide 'init-pcomplete)
;;; init-pcomplete.el ends here
