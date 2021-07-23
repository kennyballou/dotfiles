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

(use-package autodisass-java-bytecode)

;; Loosely borrowed from
;; https://github.com/jmibanez/jmi-dotemacs/blob/master/development.init.el#L139
;; Other changes from Torstein as well
;; https://gitlab.com/skybert/my-little-friends/-/blob/master/emacs/.emacs.d/tkj-java.el
(use-package lsp-java
  :init
  (defun kb/java-mode ()
    "Configure java mode settings."
    (subword-mode)
    (setq-local tab-width 4)
    (setq-local c-basic-offset 4)
    (lsp-java-boot-lens-mode)
    (lsp-deferred))
  :config

  ;; Enable dap-java
  (require 'dap-java)

  (setq lsp-java-server-install-dir (concat user-emacs-directory "lsp/eclipse.jdt.ls/server/"))
  (setq lsp-java-workspace-dir (expand-file-name (concat user-emacs-directory "eclipse.jdt.ls/workspace/")))
  (setq lsp-java-workspace-cache-dir (expand-file-name (concat user-emacs-directory "eclipse.jdt.ls/workspace/.cache/")))
  (setq lsp-java-java-path (expand-file-name "~/.nix-profile/bin/java"))
  (setq lsp-java-vmargs
        (list "-noverify"
              "-Xms1G"
              "-Xmx2G"
              "-XX:+UnlockExperimentalVMOptions"
              "-XX:+UseZGC"
              "-XX:+UseStringDeduplication"))
  (setq lsp-file-watch-ignored '(".idea" ".ensime_cache" ".eunit" "node_modules"
                                 ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr"
                                 "_darcs" ".tox" ".svn" ".stack-work" "build"))

  (setq lsp-java-save-action-organize-imports nil)
  (setq lsp-java-completion-max-results 20)
  (setq lsp-enable-on-type-formatting nil)
  (setq lsp-enable-indentation t)
  (setq lsp-java-import-maven-enabled t)
  (setq lsp-java-maven-download-sources t)
  (setq lsp-java-format-settings-url (expand-file-name (concat user-emacs-directory "/lsp-java/GoogleStyles.xml")))
  (setq lsp-java-format-settings-profile "GoogleStyle")

  :hook (java-mode . kb/java-mode)
  :after (lsp-mode dap-mode))

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
