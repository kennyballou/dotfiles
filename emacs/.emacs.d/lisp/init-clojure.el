;;; init-clojure --- Clojure Mode configuration
;;; Commentary:
;;; Code:

(defvar clojure-mode)
(defvar cljsbuild-mode)
(defvar elein)
(defvar melpa-unstable)

(use-package cljsbuild-mode
  :pin melpa-unstable)

(use-package elein
  :pin melpa-unstable)

(use-package clojure-mode
  :after (cljsbuild-mode elein)
  :defer t
  :hook ((clojure-mode-hook . subword-mode)))

(provide 'init-clojure)
;;; init-clojure.el ends here
