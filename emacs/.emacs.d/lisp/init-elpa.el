(require 'package)

(let ((local-package-el (locate-library "package")))
  (when (string-match-p (concat "^" (regexp-quote user-emacs-directory))
                        local-package-el)
    (warn "Please remove the local package.el, which is no longer supported (%s)."
          (local-package-el))))

(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (when (file-directory-p package-user-dir)
    (message "Default package locations have changed in this config: renaming old dir %s to %s"
             package-user-dir
             versioned-package-dir)
    (rename-file package-user-dir versioned-package-dir))
  (setq package-user-dir versioned-package-dir))
