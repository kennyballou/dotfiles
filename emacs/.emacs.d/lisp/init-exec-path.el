;;; init-exec-path --- exec path initialization and configuration
;;; Commentary:
;;; Code:

(require-package 'exec-path-from-shell)

(defvar exec-path-from-shell-variables)
(with-eval-after-load 'exec-path-from-shell
  (dolist (var '("SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 "GPG_AGENT_INFO"
                 "LANG"
                 "LC_CTYPE"))
    (add-to-list 'exec-path-from-shell-variables var)))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'init-exec-path)
;;; init-exec-path.el ends here
