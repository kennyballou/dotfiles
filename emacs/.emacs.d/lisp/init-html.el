;;; init-html --- html configurations
;;; Commentary:
;;; Code:

(defvar tagedit)
;; (defvar tidy)
;; (use-package tidy
;;   :pin
;;   :init
;;   (add-hook 'html-mode-hook (lambda () (tidy-build-menu html-mode-map))))

(use-package tagedit)
(with-eval-after-load 'sgml-mode
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-to-list 'auto-mode-alist '("\\.\\(jsp\\|tpml\\)\\'" . 'html-mode))

;; Note: ERB is configured in init-ruby-mode

(provide 'init-html)
;;; init-html.el ends here
