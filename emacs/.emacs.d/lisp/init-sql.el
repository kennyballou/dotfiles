;;; init-sql --- SQL mode configuration
;;; Commentary:
;;; Code:

(defvar sql-postgres-login-params)
(defvar sql-connection-alist)
(defvar sql-product)

(require 'sql)

(with-eval-after-load 'sql
  ;; sql-mode basically requires an uncustomized environment
  (push "--no-psqlrc" sql-postgres-options)
  (sql-set-product-feature 'mysql
                           :prompt-regexp
                           "^\\(MariaDB\\|MySQL\\) \\[[_a-zA-Z]*\\]> "))

(defun sanityinc/pop-to-sqli-buffer ()
  "Switch to the corresponding sqli buffer."
  (interactive)
  (if sql-buffer
      (progn
        (pop-to-buffer sql-buffer)
        (goto-char (point-max)))
    (sql-set-sqli-buffer)
    (when sql-buffer
      (sanityinc/pop-to-sqli-buffer))))

(setq-default sql-input-ring-file-name
              (expand-file-name ".sqli_history" user-emacs-directory))

;;  https://emacs.stackexchange.com/questions/657/why-do-sql-mode-and-sql-interactive-mode-not-highlight-strings-the-same-way/673
(defun sanityinc/font-lock-everything-in-sql-interactive-mode ()
  "Font lock all the things."
  (unless (eq 'oracle sql-product)
    (sql-product-font-lock nil nil)))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (sanityinc/font-lock-everything-in-sql-interactive-mode)
            (toggle-truncate-lines t)
            ))

(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "postgres")
        (port :default 5432)))

(setq-default sql-connection-alist '())

;; https://truongtx.me/2014/08/23/setup-emacs-as-an-sql-database-client
(defun open-sql-connection (product connection)
  "Open SQL prompt for PRODUCT using CONNECTION."
  ;; remember to set the sql-product, otherwise, it will fail for the
  ;; first time you call the function
  (setq sql-product product)
  (sql-connect connection))


(provide 'init-sql)
;;; init-sql.el ends here
