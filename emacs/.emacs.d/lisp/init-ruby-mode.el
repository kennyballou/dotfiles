;;; init-ruby --- Basic ruby setup
;;; Commentary:
;;; Code:

(defvar ruby-mode)
(defvar ruby-hash-syntax)
(defvar rspec-mode)
(defvar inf-ruby)
(defvar ruby-compilation)
(defvar yari)
(defvar robe)
(defvar goto-gem)
(defvar bundler)
(defvar melpa-unstable)

(use-package ruby-hash-syntax
  :defer t)
(use-package rspec-mode
  :defer t)
(use-package inf-ruby
  :defer t)
(use-package ruby-compilation
  :defer t
  :config
  (defalias 'rake 'ruby-compilation-rake))
(use-package yari
  :defer t
  :config
  (defalias 'ri 'yari))
(use-package robe
  :defer t)
(use-package goto-gem
  :defer t)
(use-package bundler)

(use-package ruby-mode
  :defer t
  :after (rspec-mode inf-ruby ruby-compilation)
  :mode (("Rakefile\\'" . ruby-mode)
         ("\\.rake\\'" . ruby-mode)
         ("\\.rxml\\'" . ruby-mode)
         ("\\.rjs\\'" . ruby-mode)
         ("\\.librc\\'" . ruby-mode)
         ("\\.pryrc\\'" . ruby-mode)
         ("\\.builder\\'" . ruby-mode)
         ("\\.ru\\'" . ruby-mode)
         ("\\.gemspec\\'" . ruby-mode)
         ("Gemfile\\'" . ruby-mode)
         ("Kirkfile\\'" . ruby-mode))
  :init
  (setq-default ruby-use-encoding-map nil)
  (setq-default ruby-insert-encoding-magic-comment nil)
  (defun kb/ruby-mode ()
    (unless derived-mode-p #'prog-mode
            (run-hook 'prog-mode-hook))
    (subword-mode)
    (lsp-mode)
    (lsp-deferred))
  :hook (ruby-mode . kb/ruby-mode)
  :bind (:map ruby-mode-map
              ("S-f7" . ruby-compilation-this-buffer)
              ("f7" . ruby-compilation-this-test)))

;;; ERB
(require 'mmm-mode)
(defun sanityinc/ensure-mmm-erb-loaded ()
  "Load mmm-erb mode."
  (require 'mmm-erb))

(require 'derived)

(defun sanityinc/set-up-mode-for-erb (mode)
  (add-hook (derived-mode-hook-name mode) 'sanityinc/ensure-mmm-erb-loaded)
  (mmm-add-mode-ext-class mode "\\.erb\\'" 'erb))

(let ((html-erb-modes '(html-mode html-erb-mode nxml-mode)))
  (dolist (mode html-erb-modes)
    (sanityinc/set-up-mode-for-erb mode)
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-js)
    (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css)))

(mapc 'sanityinc/set-up-mode-for-erb
      '(coffee-mode js-mode js2-mode js3-mode markdown-mode textile-mode))

(mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)

(dolist (regxmode (list '("\\.rhtml\\'" . 'html-erb-mode)
                        '("\\.html\\.erb\\'". 'html-erb-mode)
                        '("\\.jst\\.ejs\\'" . html-erb-mode)))
  (add-to-list 'auto-mode-alist regxmode))

(mmm-add-mode-ext-class 'yaml-mode "\\.yaml\\(\\.erb\\)?\\'" 'erb)
(sanityinc/set-up-mode-for-erb 'yaml-mode)

(dolist (mode (list 'js-mode 'js2-mode 'js3-mode))
  (mmm-add-mode-ext-class mode "\\.js\\.erb\\'" 'erb))

(provide 'init-ruby-mode)
;;; init-ruby-mode.el ends here
