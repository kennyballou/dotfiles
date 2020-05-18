;;; init-bbdb --- Insidious Big Brother Database
;;; Commentary:
;;; https://emacs-fu.blogspot.com/2009/08/managing-e-mail-addresses-with-bbdb.html
;;; Code:

(defvar bbdb)
(defvar bbdb-file)
(defvar bbdb-offer-save)
(defvar bbdb-use-pop-up)
(defvar bbdb-electric-p)
(defvar bbdb-popup-target-lines)
(defvar bbdb-dwim-net-address-allow-redundancy)
(defvar bbdb-quiet-about-name-mismatches)
(defvar bbdb-always-add-address)
(defvar bbdb-canonicalize-redundent-nets-p)
(defvar bbdb-completion-type)
(defvar bbdb-complete-name-allow-cycling)
(defvar bbdb-message-caching-enabled)
(defvar bbdb-use-alternate-names)
(defvar bbdb-elided-display)
(defvar bbdb/mail-auto-create-p)
(defvar bbdb-ignore-some-messages-alist)

(use-package bbdb
  :init
  (setq bbdb-file "~/.org/bbdb")
  (setq bbdb-offer-save 1)
  (setq bbdb-use-pop-up t)
  (setq bbdb-electric-p t)
  (setq bbdb-popup-target-lines 1)
  (setq bbdb-dwim-net-address-allow-redundancy t)
  (setq bbdb-quiet-about-name-mismatches t)
  (setq bbdb-always-add-address t)
  (setq bbdb-canonicalize-redundent-nets-p t)
  (setq bbdb-use-alternate-names t)
  (setq bbdb-completion-type nil)
  (setq bbdb-elided-display t)
  (setq bbdb/mail-auto-create-p #'bbdb-ignore-some-messages-hook)
  (setq bbdb-ignore-some-messages-alist
        (quote (("From" . "no.?reply\\|DAEMON\\|daemon\\|"))))
  )

(provide 'init-bbdb)
;;; init-bbdb.el ends here
