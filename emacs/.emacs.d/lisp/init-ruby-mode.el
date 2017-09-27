;;; Basic ruby setup
(require-package 'ruby-mode)
(require-package 'ruby-hash-syntax)

(dolist (regxmode (list '("Rakefile\\'" . 'ruby-mode)
                        '("\\.rake\\'" . 'ruby-mode)
                        '("\\.rxml\\'" . 'ruby-mode)
                        '("\\.rjs\\'" . 'ruby-mode)
                        '("\\.librc\\'" . 'ruby-mode)
                        '("\\.pryrc\\'" . 'ruby-mode)
                        '("\\.builder\\'" . 'ruby-mode)
                        '("\\.ru\\'" . 'ruby-mode)
                        '("\\.gemspec\\'" . 'ruby-mode)
                        '("Gemfile\\'" . 'ruby-mode)
                        '("Kirkfile\\'" . 'ruby-mode)
                        '("Gemfile\\.lock\\'" . 'conf-mode)))
  (add-to-list 'auto-mode-alist regxmode))

(setq-default
 ruby-use-encoding-map nil
 ruby-insert-encoding-magic-comment nil)

(with-eval-after-load 'ruby-mode
  ;; Stupidly the non bundled ruby-mode isn't a drived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (add-hook 'ruby-mode-hook
            (lambda ()
              (unless (derived-mode-p 'prog-mode)
                (run-hook 'prog-mode-hook)))))

(add-hook 'ruby-mode-hook 'subword-mode)

(require-package 'rspec-mode)

;; Inferior ruby
(require-package 'inf-ruby)

;;; Ruby compilation
(require-package 'ruby-compilation)

(with-eval-after-load 'ruby-mode
  (let ((m ruby-mode-map))
    (define-key m [S-f7] 'ruby-compilation-this-buffer)
    (define-key m [f7] 'ruby-compilation-this-test)))

(with-eval-after-load 'ruby-compilation
  (defalias 'rake 'ruby-compilation-rake))

;;; Robe
(when (maybe-require-package 'robe)
  (with-eval-after-load 'ruby-mode
    (add-hook 'ruby-mode-hook 'robe-mode))
  (with-eval-after-load 'company
    (dolist (hook '(ruby-mode-hook
                    inf-ruby-mode-hook
                    html-erb-mode-hook
                    haml-mode))
      (add-hook hook
                (lambda () (sanityinc/local-push-company-backend
                            'company-robe))))))

;; ri support
(require-package 'yari)
(defalias 'ri 'yari)

(require-package 'goto-gem)

(require-package 'bundler)

;;; ERB
(require-package 'mmm-mode)
(defun sanityinc/ensure-mmm-erb-loaded ()
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
