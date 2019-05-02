;;; init-css --- CSS configuration
;;; Commentary:
;;; Code:

;;; Colourise CSS colour literals

(defvar rainbow-mode)
(defvar sass-mode)
(defvar scss-mode)
(defvar less-css-mode)
(defvar skewer-less)
(defvar skewer-mode)
(defvar css-eldoc)

(require 'rainbow-mode)

(dolist (hook '(css-mode-hook html-mode-hook sass-mode-hook))
  (add-hook hook 'rainbow-mode))

;;; Embedding in HTML
(require 'mmm-mode)
(with-eval-after-load 'mmm-vars
  (mmm-add-group
   'html-css
   '((css-cdata
      :submode css-mode
      :face mmm-code-submode-face
      :front "<style[^>]*>[ \t\n]*\\(//\\)?<\\[CDATA\\[[ \t]*\n?"
      :back "[ \t]*\\(//\\)?]]>[ \t\n]*</style>"
      :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                   @ "\n" _ "\n" @ "</style>" @)))
     (css
      :submode css-mode
      :face mmm-code-submode-face
      :front "<style[^>]*>[ \t]*\n?"
      :back "[ \t]*</style>"
      :insert ((?j js-tag nil @ "<style type=\"text/css\">"
                   @ "\n" _ "\n" @ "</style>" @)))
     (css-inline
      :submode css-mode
      :face mmm-code-submode-face
      :front "style=\""
      :back "\"")))
  (dolist (mode (list 'html-mode 'nxml-mode))
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css)))

;;; SASS and SCSS
(use-package sass-mode)
(use-package scss-mode)
(setq-default scss-compile-at-save nil)

;;; LESS
(use-package less-css-mode)
(use-package skewer-less
  :after less-css-mode
  :hook (less-css-mode-hook . skewer-less-mode))

;; Skewer CSS
(use-package skewer-mode
  :hook css-mode-hook)

;;; Use eldoc for syntax hints
(use-package css-eldoc
  :defer t
  :hook (css-mode-hook . turn-on-css-eldoc)
  :init
  (autoload 'turn-on-css-eldoc "css-eldoc"))

(provide 'init-css)
;;; init-css.el ends here
