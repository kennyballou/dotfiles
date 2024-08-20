;;; init-clojure-cider --- Clojure Cider Configuration
;;; Commentary:
;;; Code:

(defvar cider)
(defvar flycheck-clojure)
(defvar nrepl-popup-stacktraces)

(use-package cider
  :init
  (setq nrepl-popup-stacktraces nil)
  :hook ((cider-mode-hook . eldoc-mode)
         (cider-repl-mode-hook . subword-mode)
         (cider-repl-mode-hook . paredit-mode)))

(use-package flycheck-clojure
  :after (clojure flycheck)
  :config
  (flycheck-clojure-setup))

(provide 'init-clojure-cider)
;;; init-clojure-cider.el ends here
