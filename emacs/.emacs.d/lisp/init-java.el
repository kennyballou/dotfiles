;;; init-java -- Configuration for Java and JDEE
;;; Commentary:
;;; Code:

(defvar autodisass-java-bytecode)
(defvar meghanada)
(defvar meghanada-server-remote-debug)
(defvar meghanada-javac-xlint)
(defvar lsp-java)
(defvar dap-java)
(defvar c-basic-offset)

(use-package autodisass-java-bytecode
  :defer t
  :config
  ;; It's not sufficient for this package to work without this require??
  (require 'autodisass-java-bytecode))

;; Loosely borrowed from
;; https://github.com/jmibanez/jmi-dotemacs/blob/master/development.init.el#L139
;; Other changes from Torstein as well
;; https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs.d/tkj-java.el
(use-package lsp-java
  :init
  (defun kb/java-mode-config ()
    (subword-mode)
    (setq-local tab-width 4)
    (setq-local c-basic-offset 4)
    (lsp))

  :config
  ;; Enable dap-java
  (require 'dap-java)

  (setq lsp-java-vmargs
        (list "-noverify"
              "-Xmx2G"
              "-XX:+UseG1GC"
              "-XX:+UseStringDeduplication")
        lsp-file-watch-ignored '(".idea" ".ensime_cache" ".eunit" "node_modules"
                                 ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr"
                                 "_darcs" ".tox" ".svn" ".stack-work" "build")

        lsp-java-save-action-organize-imports nil
        lsp-enable-on-type-formatting t
        lsp-enable-indentation t)

  :hook (java-mode  . kb/java-mode-config)
  :after (lsp lsp-mode dap-mode))

(use-package dap-java
  :ensure nil
  :after (lsp-java)
  :config
  (dap-register-debug-template
   "debug..."
   (list :type "java"
         :request "attach"
         :hostName "localhost"
         :port 5005)))

(provide 'init-java)
;;; init-java.el ends here
