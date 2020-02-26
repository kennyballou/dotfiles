;;; init-java -- Configuration for Java and JDEE
;;; Commentary:
;;; Code:

(defvar autodisass-java-bytecode)
(defvar jdee)
(defvar meghanada)
(defvar meghanada-server-remote-debug)
(defvar meghanada-javac-xlint)
(defvar melpa-unstable)
(defvar jdee-server-dir)
(defvar c-basic-offset)

(use-package autodisass-java-bytecode
  :defer t)

(use-package jdee
  :defer t
  :custom
  (jdee-server-dir (string-join (list (getenv "HOME")
                                      ".m2/repository/com/github"
                                      "jdee-emacs/jdee-server/1.1-SNAPSHOT")
                                "/")))

(use-package meghanada
  :defer t
  :commands (meghanada-mode)
  :init
  (add-hook 'java-mode-hook
            (lambda ()
              (meghanada-mode t)
              (smartparens-mode t)
              (rainbow-delimiters-mode t)
              (auto-highlight-symbol-mode t)
              (add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))
  :config
  (setq indent-tabs-mode nil)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq meghanada-server-remote-debug t)
  (setq meghanada-javac-xlint "-Xlint:all,-processing")
  :bind (:map meghanada-mode-map
              ("C-S-t" . meghanada-switch-testcase)
              ("M-RET" . meghanada-local-variable)
              ("C-M-." . helm-imenu)
              ("M-r" . meghanada-reference)
              ("M-t" . meghanada-typeinfo)
              ("C-z" . hydra-meghanada/body)))

(defhydra hydra-meghanada (:hint nil :exit t)
  "
^Edit^                           ^Tast or Task^
^^^^^^-------------------------------------------------------
_f_: meghanada-compile-file      _m_: meghanada-restart
_c_: meghanada-compile-project   _t_: meghanada-run-task
_o_: meghanada-optimize-import   _j_: meghanada-run-junit-test-case
_s_: meghanada-switch-test-case  _J_: meghanada-run-junit-class
_v_: meghanada-local-variable    _R_: meghanada-run-junit-recent
_i_: meghanada-import-all        _r_: meghanada-reference
_g_: magit-status                _T_: meghanada-typeinfo
_l_: helm-ls-git-ls
_q_: exit
"
  ("f" meghanada-compile-file)
  ("m" meghanada-restart)
  ("c" meghanada-compile-project)
  ("o" meghanada-optimize-import)
  ("s" meghanada-switch-test-case)
  ("v" meghanada-local-variable)
  ("i" meghanada-import-all)

  ("g" magit-status)
  ("l" helm-ls-git-ls)
  ("t" meghanada-run-task)
  ("T" meghanada-typeinfo)
  ("j" meghanada-run-junit-test-case)
  ("J" meghanada-run-junit-class)
  ("R" meghanada-run-junit-recent)
  ("r" meghanada-reference)

  ("q" exit)
  ("z" nil "leave"))


(provide 'init-java)
;;; init-java.el ends here
