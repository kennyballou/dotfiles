;;; init-elpa --- Package configuration
;;; Commentary:
;;; Code:
(require 'package)

(dolist (pkg '(("melpa-stable" . "https://stable.melpa.org/packages/")
               ("org" . "https://orgmode.org/elpa/")
               ("gnu" . "http://elpa.gnu.org/packages/")
               ("melpa-unstable" . "https://melpa.org/packages/")))
  (add-to-list 'package-archives pkg))

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

;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will no b
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install-package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(defun maybe-require-package (package &optional min-version no-refresh)
  "Try to install PACKAGE, and return non-nill if successful.
In the event of failure, return nil and print a warning message.
Optionally require MIN-VERSION.  If NO-REFRESH is non-nil, the
available package lists will not be re-downloaded in order to
locate PACKAGE."
  (condition-case err
      (require-package package min-version no-refresh)
    (error
     (message "Coudln't install optional package '%s': %S" package err)
     nil)))

;;; Fire up package.el
(setq package-enable-at-startup nil)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(provide 'init-elpa)
;;; init-elpa.el ends here
