(when (maybe-require-package 'clojure-mode)
  (require-package 'cljsbuild-mode)
  (require-package 'elein)

  (with-eval-after-load 'clojure-mode
    (add-hook 'clojure-mode-hook 'subword-mode)))

(provide 'init-clojure)
