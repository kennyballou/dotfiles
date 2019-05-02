;;; init-elpa --- Package configuration
;;; Commentary:
;;; Code:
(require 'package)

(setq package-archives nil)

(let ((local-package-el (locate-library "package")))
  (when (string-match-p (concat "^" (regexp-quote user-emacs-directory))
                        local-package-el)
    (warn "Please remove the local package.el, which is no longer supported (%s)."
          (local-package-el))))

(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s"
                                 emacs-major-version
                                 emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

;;; Fire up package.el
(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(provide 'init-elpa)
;;; init-elpa.el ends here
