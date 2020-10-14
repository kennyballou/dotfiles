;;; init-env --- Environment Variable Configuration
;;; Commentary:
;;; Code:

(require 'eshell)
(require 'subr-x)
(require 'dash)

(defun kb/join-paths (paths &optional path-separator)
  "Join the given PATHS together using the PATH-SEPARATOR."
  (or path-separator (setq path-separator ":"))
  ;; Remove duplicate path entries
  (let* ((paths (-remove (lambda (p) (not p)) paths))
         (split-paths (lambda (p) (split-string p path-separator)))
         (paths-to-join (-flatten (map #'list split-paths paths))))
    (string-join (seq-uniq paths-to-join) path-separator)))

(let* ((user-home (getenv "HOME"))
       (user-nix-profile (concat user-home "/.nix-profile/"))
       (python-path (getenv "PYTHONPATH"))
       (c-include-path (getenv "C_INCLUDE_PATH"))
       (cpp-include-path (getenv "CPLUS_INCLUDE_PATH"))
       (library-path (getenv "LIBRARY_PATH"))
       (ghc-package-path (getenv "GHC_PACKAGE_PATH")))
  (progn
    (eshell/addpath (concat user-nix-profile "/bin"))
    (setenv "PATH" (concat  "/bin" (getenv "PATH")))
    (setenv "PYTHONPATH" (kb/join-paths
                          (list (concat user-nix-profile
                                        "/lib/python3.7/site-packages")
                                python-path)))
    (setenv "C_INCLUDE_PATH" (kb/join-paths
                              (list (concat user-nix-profile "/include")
                                    c-include-path)))
    (setenv "CPLUS_INCLUDE_PATH" (kb/join-paths
                                  (list (concat user-nix-profile "/include")
                                        cpp-include-path)))))

(provide 'init-env)
;;; init-env.el ends here
