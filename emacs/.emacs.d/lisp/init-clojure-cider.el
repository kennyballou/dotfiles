;;; init-clojure-cider --- Clojure Cider Configuration
;;; Commentary:
;;; Code:

(defvar cider)
(defvar flycheck-clojure)
(defvar nrepl-popup-stacktraces)

(use-package cider
  :defer t
  :init
  (setq nrepl-popup-stacktraces nil)
  :hook ((cider-mode-hook . eldoc-mode)
         (cider-repl-mode-hook . subword-mode)
         (cider-repl-mode-hook . paredit-mode)
         (cider-repl-mode-hook . #'sanityinc/no-trailing-whitespace)))

(use-package flycheck-clojure
  :after (clojure flycheck)
  :defer t
  :config
  (flycheck-clojure-setup))

(provide 'init-clojure-cider)
;;; init-clojure-cider.el ends here
