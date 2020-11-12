;;; init-email --- Email/Mu4e configuration
;;; Commentary:
;;; Configuration taken from the tutorial found here:
;;; https://vxlabs.com/2014/06/06/configuring-emacs-mu4e-with-nullmailer-offlineimap-and-multiple-identities/
;;; https://vxlabs.com/2017/02/07/mu4e-0-9-18-e-mailing-with-emacs-now-even-better/
;;; Code:

(defvar helm-mu)

(require 'mu4e)
(require 'mu4e-vars)
(require 'org-mu4e)
(use-package helm-mu
  :after (mu4e helm)
  :bind (:map mu4e-main-mode-map
         ("s" . #'helm-mu)
         :map mu4e-headers-mode-map
         ("s" . #'helm-mu)
         :map mu4e-view-mode-map
         ("s" . #'helm-mu)))

(setq mu4e-compose-format-flowed nil
      mu4e-use-fancy-chars t
      mu4e-headers-date-format "%Y-%m-%d %H:%M"
      message-citation-line-format "On %Y-%m-%d %H:%M %Z, %N wrote:"
      message-citation-line-function #'message-insert-formatted-citation-line
      mu4e-view-show-addresses t
      mu4e-get-mail-command "mbsync -a"
      mu4e-headers-sort-field :date
      mu4e-headers-sort-direction 'ascending
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "msmtp"
      mail-specifiy-envelope-from t
      message-sendmail-f-is-evil nil
      message-sendmail-envelope-from 'header
      mu4e-change-filenames-when-moving t
      org-mu4e-link-query-in-headers-mode nil
      message-kill-buffer-on-exit t
      mu4e-context-policy 'pick-first
      mu4e-confirm-quit nil
      mu4e-sent-messages-behavior 'sent
      ;; without this, "symbol's value as variable is void: mml2014-use" when signing
      ;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
      ;; so set to epg and all was good!
      ;; to sign a mail: M-x mml-secure-sign-pgpmime
      mml2014-use 'epg)



;; (setq mu4e-contexts
;;       `(,(make-mu4e-context
;;           :name "account"
;;           :match-func (lambda (msg) (kb/msg-to-account-p msg))
;;           :vars `((mu4e-root-maildir . ,(kb/account-maildir))
;;                   (user-mail-address . "mail@example.com")
;;                   (user-full-name . "User Name")
;;                   (my-xpgp-key-uri . "https://example.com/path/to/public.asc")
;;                   (mu4e-compose-signature . "\n")
;;                   (mu4e-maildir-shortcuts . ((:maildir "/account/INBOX" :key ?i)
;;                                              (:maildir "/account/archive" :key ?a)
;;                                              (:maildir "/account/trash" :key ?t)
;;                                              (:maildir "/account/sent" :key ?s)))
;;                   (mu4e-trash-folder . "/account/trash")
;;                   (mu4e-refile-folder . "/account/archive")
;;                   (mu4e-sent-folder . "/account/sent")
;;                   (mu4e-drafts-folder . "/account/drafts")
;;                   (mu4e-sent-messages-behavior . 'sent)))
;;         ))

(add-hook 'mu4e-compose-mode-hook
          (lambda ()
            (set-fill-column 72)
            (flyspell-mode)
            (save-excursion
              (message-add-header (format "X-PGP-Key: %s\n"
                                          my-xpgp-key-uri)))))

;; Replace default compose with mu4e
(global-set-key (kbd "C-x m") 'mu4e-compose-new)
;; Add shortcut for _only_ updating the index
(define-key mu4e-main-mode-map (kbd "u") #'mu4e-update-index)
;; http://pragmaticemacs.com/emacs/some-useful-mu4e-shortcuts/
;; Add CC line
(define-key mu4e-compose-mode-map (kbd "C-1 c") #'message-goto-cc)



(setq bbdb-mail-user-agent 'mu4e-user-agent
      mu4e-view-mode-hook 'bbdb-mua-auto-update
      mu4e-compose-complete-addresses nil
      bbdb-mua-pop-up nil
      bbdb-mua-pop-up-window-size 5
      mu4e-view-show-addresses t)



(provide 'init-mu4e)
;;; init-mu4e.el ends here
