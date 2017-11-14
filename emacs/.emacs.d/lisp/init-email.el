;;; init-email --- Email/Mu4e configuration
;;; Commentary:
;;; Configuration taken from the tutorial found here:
;;; https://vxlabs.com/2014/06/06/configuring-emacs-mu4e-with-nullmailer-offlineimap-and-multiple-identities/
;;; Code:

;; http://xahlee.blogspot.com/2010/09/elisp-read-file-content-in-one-shot.html
;; we'll use this to read your different signatures from files
(defun get-string-from-file (filePath)
  "Return FILEPATH's file contents."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)

(setq mu4e-maildir (concat (getenv "HOME") "/.mail"))

(setq mu4e-use-fancy-chars t)

(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

(setq message-citation-line-format "On %Y年%m月%d日 %H:%M %Z, %N wrote:")
(setq message-citation-line-function #'message-insert-formatted-citation-line)

(setq mu4e-view-show-addresses t)

;; without this, "symbol's value as variable is void: mml2014-use" when signing
;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
;; so set to epg and all was good!
;; to sign a mail: M-x mml-secure-sign-pgpmime
(setq mml2014-use 'epg)


(provide 'init-email)
;;; init-email.el ends here
