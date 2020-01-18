;;; init-java -- Configuration for Java and JDEE
;;; Commentary:
;;; Code:

(defvar jdee)
(defvar meghanada)
(defvar melpa-unstable)
(defvar jdee-server-dir)

(use-package jdee
  :defer t
  :custom
  (jdee-server-dir (string-join (list (getenv "HOME")
                                      ".m2/repository/com/github"
                                      "jdee-emacs/jdee-server/1.1-SNAPSHOT")
                                "/")))

(use-package meghanada
  :mode ("\\.java" . meghanada-mode))

(provide 'init-java)
;;; init-java.el ends here
