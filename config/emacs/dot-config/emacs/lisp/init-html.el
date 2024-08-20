;;; init-html --- html configurations
;;; Commentary:
;;; Code:

(defvar tagedit)

(use-package tagedit)
(with-eval-after-load 'sgml-mode
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-to-list 'auto-mode-alist '("\\.\\(jsp\\|tpml\\)\\'" . html-mode))

;; Note: ERB is configured in init-ruby-mode

(provide 'init-html)
;;; init-html.el ends here
