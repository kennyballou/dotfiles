;;; init-email --- Email/Mu4e configuration
;;; Commentary:
;;; Configuration taken from the tutorial found here:
;;; https://vxlabs.com/2014/06/06/configuring-emacs-mu4e-with-nullmailer-offlineimap-and-multiple-identities/
;;; https://vxlabs.com/2017/02/07/mu4e-0-9-18-e-mailing-with-emacs-now-even-better/
;;; Code:

;; http://xahlee.blogspot.com/2010/09/elisp-read-file-content-in-one-shot.html
;; we'll use this to read your different signatures from files
(defun get-string-from-file (filePath)
  "Return FILEPATH's file contents."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

;; not sure this is explicitly needed yet..
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

(require 'mu4e)

(setq mu4e-use-fancy-chars t)

(setq mu4e-maildir "~/.mail")

(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

(setq message-citation-line-format "On %Y年%m月%d日 %H:%M %Z, %N wrote:")
(setq message-citation-line-function #'message-insert-formatted-citation-line)

(setq mu4e-view-show-addresses t)

(setq mu4e-maildir-shortcuts
      '(("/archive" . ?a)
        ("/sent"    . ?s)
        ("/INBOX"   . ?i)))

(setq mu4e-user-mail-address-list '("kballou@devnulllabs.io"
                                    "kennethmgballou@gmail.com"
                                    "kennyballou@u.boisestate.edu"
                                    "kenny@homecu.com"))

(setq mu4e-get-mail-command "offlineimap")

(setq mu4e-headers-sort-field :date
      mu4e-headers-sort-direction 'ascending)

(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq sendmail-program "/usr/bin/msmtp"
      mail-specifiy-envelope-from t
      message-sendmail-f-is-evil nil
      mail-envelope-from 'header
      message-sendmail-envelope-from 'header)

;; without this, "symbol's value as variable is void: mml2014-use" when signing
;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
;; so set to epg and all was good!
;; to sign a mail: M-x mml-secure-sign-pgpmime
(setq mml2014-use 'epg)

(setq mu4e-contexts
      `(,(make-mu4e-context
          :name "devnulllabs"
          :enter-func (lambda () (mu4e-message "entered devnulllabs"))
          :leave-func (lambda () (mu4e-message "left devnulllabs"))
          :match-func (lambda (msg)
                        (when msg
                          (mu4e-message-contact-field-matches
                           msg
                           :to "*@devnulllabs.io")))
          :vars '((user-mail-address . "kballou@devnulllabs.io")
                  (user-full-name . "Kenny Ballou")
                  (mu4e-maildir . "~/.mail/kballou-devnulllabs.io/")
                  (mu4e-compose-signature . ":SIG:!0xB0CAA28A02958308!:\n")))
        ,(make-mu4e-context
          :name "homecu"
          :enter-func (lambda () (mu4e-message "entered homecu"))
          :leave-func (lambda () (mu4e-message "left homecu"))
          :match-func (lambda (msg)
                        (when msg
                          (mu4e-message-contact-field-matches
                           msg
                           :to "*@homecu.*\'")))
          :vars '((user-mail-address . "kenny@homecu.com")
                  (user-full-name . "Kenny Ballou")
                  (mu4e-maildir . "~/.mail/kenny-homecu.com/")
                  (mu4e-sent-messages-behavior "delete")
                  (mu4e-compose-signature . (concat
                                             "Kenny Ballou\n"
                                             "SRE @ HomeCU\n"
                                             ":SIG:!0x9295F09320C0160A!:\n"))))
        ))


(provide 'init-email)
;;; init-email.el ends here
