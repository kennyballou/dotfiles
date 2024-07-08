;;; init-email --- email/message/gnus configuration
;;; Commentary:
;;; Configuration borrowed from the tutorial found here:
;;; https://protesilaos.com/dotemacs/#h:14cf6fea-54eb-4faa-bb16-3739485c929a
;;; https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
;;; Code:

(defvar sendmail-program)

(require 'mm-encode)
(setq mm-encrypt-option 'guided)
(setq mm-sign-option 'guided)

(require 'mml-sec)
(setq mml-secure-openpgp-encrypt-to-self t)
(setq mml-secure-openpgp-sign-with-sender nil)
(setq mml-secure-smime-encrypt-to-self t)
(setq mml-secure-smime-sign-with-sender nil)

(require 'message)
(setq mail-user-agent 'message-user-agent)
;; (setq mail-header-separator (purecopy "* * *"))
(setq compose-mail-user-agent-warnings nil)
(setq message-mail-user-agent nil)
(setq mail-signature-file "~/.signature")
(setq message-cite-function #'message-cite-original-without-signature)
(setq message-citation-line-format "On %Y-%m-%d, %R %z, %N wrote:\n")
(setq message-citation-line-function
      #'message-insert-formatted-citation-line)
(setq message-yank-cited-prefix ">")
(setq sendmail-program "msmtp")
(setq mail-specify-envelope-from t)
(setq message-sendmail-f-is-evil nil)
(setq message-sendmail-envelope-from 'header)
(setq message-confirm-send t)
(setq message-kill-buffer-on-exit t)
(setq message-wide-reply-confirm-recipients t)
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(add-to-list 'mm-body-charset-encoding-alist '(utf-8 . base64))

(require 'gnus)
(require 'gnus-sum)
(require 'gnus-dired)
(require 'gnus-topic)
(require 'nnir)

;; Override the default GNUS directories
(setq gnus-agent-directory (expand-file-name "~/.gnus/agent"))
(setq gnus-article-save-directory (expand-file-name "~/.gnus/"))
(setq gnus-cache-directory (expand-file-name "~/.cache/gnus/"))
(setq gnus-directory (expand-file-name "~/.gnus/"))
(setq gnus-dribble-directory (expand-file-name "~/.gnus/dribble"))
(setq message-directory (expand-file-name "~/.gnus/mail"))
(setq mail-default-directory (expand-file-name "~/.gnus/"))
(setq mail-source-directory (expand-file-name "~/.gnus/"))
(setq nndraft-directory (expand-file-name "~/.gnus/drafts"))
(setq nnfolder-directory (expand-file-name "~/.gnus/archive"))
;; (setq gnus-message-archive-group (format-time-string "sent/%Y/%m"))
(setq gnus-message-archive-group
   '((format-time-string "sent/%Y/%m" (current-time))))

(setq gnus-fetch-old-headers 'some)
(setq gnus-search-use-parsed-queries t)
(setq gnus-permanently-visible-groups ".*")
(setq gnus-search-use-parsed-queries t)
(setq gnus-gcc-mark-as-read t)
(setq gnus-agent t)
(setq gnus-novice-user nil)
(setq gnus-check-new-newsgroups 'ask-server)
(setq gnus-read-active-file 'some)
(setq gnus-use-dribble-file t)
(setq gnus-always-read-dribble-file t)
(setq gnus-agent-article-alist-save-format 1) ; uncompressed
(setq gnus-agent-cache t)
(setq gnus-agent-confirmation-function 'y-or-n-p)
(setq gnus-agent-consider-all-articles nil)
(setq gnus-agent-directory "~/.gnus/agent/")
(setq gnus-agent-expire-all nil)
(setq gnus-agent-expire-days 30)
(setq gnus-agent-mark-unread-after-downloaded t)
(setq gnus-agent-queue-mail t) ; queue if unplugged
(setq gnus-agent-synchronize-flags nil)
(setq gnus-article-browse-delete-temp 'ask)
(setq gnus-article-over-scroll nil)
(setq gnus-article-show-cursor t)
(setq gnus-article-sort-functions
      '((not gnus-article-sort-by-number)
        (not gnus-article-sort-by-date)))
(setq gnus-article-truncate-lines nil)
(setq gnus-html-frame-width 80)
(setq gnus-html-image-automatic-caching t)
(setq gnus-inhibit-images t)
(setq gnus-max-image-proportion 0.7)
(setq gnus-treat-display-smileys nil)
(setq gnus-article-mode-line-format "%G %S %m")
(setq gnus-visible-headers
      '("^From\:"
        "^To\:"
        "^Cc\:"
        "^Subject\:"
        "^Newsgroups\:"
        "^Date\:"
        "^Followup-To\:"
        "^Reply-To\:"
        "^Organization\:"
        "^X-Newsreader\:"
        "^X-Mailer\:"
        "^References\:"))
(setq gnus-sorted-header-list gnus-visible-headers)
(setq gnus-asynchronous t)
(setq gnus-use-article-prefetch 15)
(setq gnus-level-subscribed 6)
(setq gnus-level-unsubscribed 7)
(setq gnus-level-zombie 8)
(setq gnus-activate-level 1)
(setq gnus-list-groups-with-ticked-articles nil)
(setq gnus-group-sort-function
      '((gnus-group-sort-by-unread)
        (gnus-group-sort-by-alphabet)
        (gnus-group-sort-by-rank)))
(setq gnus-group-line-format "%M%p%P%5y:%B%(%g%)\n")
(setq gnus-group-mode-line-format "%%b")
(setq gnus-topic-display-empty-topics nil)
(setq gnus-auto-select-first nil)
(setq gnus-summary-ignore-duplicates t)
(setq gnus-suppress-duplicates t)
(setq gnus-save-duplicate-list t)
(setq gnus-summary-goto-unread nil)
(setq gnus-summary-make-false-root 'adopt)
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-subject)
(setq gnus-summary-gather-subject-limit 'fuzzy)
(setq gnus-thread-sort-functions
      '((not gnus-thread-sort-by-date)
        (not gnus-thread-sort-by-number)))
(setq gnus-thread-hide-subtree nil)
(setq gnus-thread-ignore-subject nil)
(setq gnus-user-date-format-alist
      '(((gnus-second-today) . "Today at %R")
        ((+ (* 60 60 24) (gnus-seconds-today)) . "Yesterday, %R")
        (t . "%Y-%m-%d %R")))
(setq gnus-ignored-from-addresses "Kenny Ballou")
(setq gnus-summary-to-prefix "To: ")
(setq gnus-summary-line-format "%U%R %-18,18&user-date; %4L:%-25,25f %B%s\n")
(setq gnus-summary-mode-line-format "[%U] %p")
(setq gnus-sum-thread-tree-false-root "")
(setq gnus-sum-thread-tree-indent " ")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+->")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-leaf "\\->")
(setq gnus-sum-thread-tree-vertical "|")

(add-hook 'dired-mode-hook #'gnus-dired-mode)
;; (add-hook 'gnus-group-mode-hook #'hl-line-mode)
(add-hook 'gnus-group-mode-hook #'gnus-topic-mode)
;; (add-hook 'gnus-summary-mode-hook #'hl-line-mode)
;; (add-hook 'gnus-browse-mode-hook #'hl-line-mode)
;; (add-hook 'gnus-server-mode-hook #'hl-line-mode)
(add-hook 'gnus-select-group-hook #'gnus-group-set-timestamp)
(let ((map gnus-article-mode-map))
  (define-key map (kbd "i") #'gnus-article-show-images)
  (define-key map (kbd "s") #'gnus-mime-save-part)
  (define-key map (kbd "o") #'gnus-mime-copy-part))
(let ((map gnus-group-mode-map))
  (define-key map (kbd "n") #'gnus-group-next-group)
  (define-key map (kbd "p") #'gnus-group-prev-group)
  (define-key map (kbd "M-n") #'gnus-topic-goto-next-topic)
  (define-key map (kbd "M-p") #'gnus-topic-goto-previous-topic))
(let ((map gnus-summary-mode-map))
  (define-key map (kbd "<delete>") #'gnus-summary-delete-article)
  (define-key map (kbd "n") #'gnus-summary-next-article)
  (define-key map (kbd "p") #'gnus-summary-prev-article)
  (define-key map (kbd "N") #'gnus-summary-next-unread-article)
  (define-key map (kbd "P") #'gnus-summary-prev-unread-article)
  (define-key map (kbd "M-n") #'gnus-summary-next-thread)
  (define-key map (kbd "M-p") #'gnus-summary-prev-thread)
  (define-key map (kbd "C-M-n") #'gnus-summary-next-group)
  (define-key map (kbd "C-M-p") #'gnus-summary-prev-group)
  (define-key map (kbd "C-M-^") #'gnus-summary-refer-thread))


(defun getmail ()
  "Execute getmail in asynchronous buffer."
  (interactive)
  (let ((out-buffer (get-buffer-create "*getmail*"))
        (err-buffer (get-buffer-create "*getmail error*")))
    (async-shell-command "getmail --rcfile ~/.getmail/getmailrc --rcfile ~/.getmail/getmailuboisestate"
                         out-buffer
                         err-buffer)))

(provide 'init-email)
;;; init-email.el ends here
