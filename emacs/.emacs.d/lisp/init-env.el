;;; init-env --- Environment Variable Configuration
;;; Commentary:
;;; Code:

(defvar dash)
(defvar melpa-unstable)

(require 'eshell)
(require 'subr-x)
(use-package dash
  :pin melpa-unstable)


(defun kb/join-paths (paths &optional path-separator)
  "Join the given PATHS together using the PATH-SEPARATOR."
  (or path-separator (setq path-separator ":"))
  ;; Remove duplicate path entries
  (let* ((split-paths (lambda (p) (split-string p path-separator)))
         (paths-to-join (-flatten (map 'list split-paths paths))))
    (string-join (seq-uniq paths-to-join) path-separator)))

(let* ((user-home (getenv "HOME"))
       (guix-profile (concat user-home "/.guix-profile"))
       (guix-current (concat user-home "/.config/guix/current"))
       (guix-bin (concat guix-current "/bin"))
       (python-path (getenv "PYTHONPATH"))
       (c-include-path (getenv "C_INCLUDE_PATH"))
       (cpp-include-path (getenv "CPLUS_INCLUDE_PATH"))
       (library-path (getenv "LIBRARY_PATH"))
       (ssl-cert-dir (concat guix-profile "/etc/ssl/certs"))
       (ssl-cert-file (concat ssl-cert-dir "/ca-certificates.crt")))
  (progn
    (eshell/addpath (concat guix-profile "/bin"))
    (setenv "PATH" (concat guix-profile "/bin" (getenv "PATH")))
    (setenv "SSL_CERT_DIR" ssl-cert-dir)
    (setenv "SSL_CERT_FILE" ssl-cert-file)
    (setenv "GIT_SSL_CAINFO" ssl-cert-file)
    (setenv "GUIX_LOCPATH" (concat guix-profile "/lib/locale"))
    (setenv "PYTHONPATH" (kb/join-paths
                          (list (concat guix-profile
                                        "/lib/python3.6/site-packages")
                                python-path)))
    (setenv "C_INCLUDE_PATH" (kb/join-paths
                              (list (concat guix-profile "/include")
                                    c-include-path)))
    (setenv "CPLUS_INCLUDE_PATH" (kb/join-paths
                                  (list (concat guix-profile "/include")
                                        cpp-include-path))
            (setenv "LIBRARY_PATH" (kb/join-paths
                                    (list (concat guix-profile "/lib")
                                          library-path))))))

(provide 'init-env)
;;; init-env.el ends here
