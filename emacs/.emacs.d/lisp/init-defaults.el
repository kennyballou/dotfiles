;;; init-defaults --- default configurations
;;; Commentary:
;;; https://matthewbauer.us/blog/bauer.html
;;; Code:

(setq-default TeX-auto-save t
              TeX-engine 'xetex
              ad-redefinition-action 'accept
              apropros-do-all t
              async-shell-command-buffer 'new-buffer
              auth-source-save-behavior t
              auto-revert-check-vc-info t
              auto-revert-verbose nil
              auto-save-visited-file-name t
              backward-delete-char-untabify-method 'hungry
              bookmark-save-flag t
              c-syntactic-indentation t
              comint-process-echoes t
              comint-input-ignoredups t
              comint-prompt-read-only t
              comint-scroll-show-maximum-output nil
              company-auto-complete (lambda () (and (company-tooltip-visible-p)
                                               (company-explicit-action-p)))
              company-frontends '(company-pseudo-tooltip-unless-just-one-frontend
                                  company-preview-frontend
                                  company-echo-metadata-frontend)
              company-continue-commands '(not save-buffer
                                              save-some-buffers
                                              save-buffers-kill-terminal
                                              save-buffers-kill-emacs
                                              comint-previous-matching-input-from-input
                                              comint-next-matching-input-from-input)
              company-require-match nil
              company-selection-wrap-around t
              compilation-always-kill nil
              compilation-ask-about-save nil
              compilation-auto-jump-to-first-error nil
              compilation-environment '("TERM=xterm-256color")
              compilation-scroll-output nil
              completions-format 'vertical
              completion-cycle-threshold 5
              counsel-find-file-at-point t
              counsel-mode-override-describe-bindings t
              create-lockfiles t
              checkdoc-spellcheck-documentation-flag t
              delete-old-versions t
              delete-by-moving-to-trash t
              dired-auto-revert-buffer t
              dired-hide-details-hide-symlink-targets nil
              dired-dwim-target t
              dired-listing-switches "-alhv"
              dired-omit-verbose nil
              dired-omit-files "^\\."
              dired-recursive-copies 'always
              dired-recursive-deletes 'always
              dtrt-indent-verbosity 0
              disabled-command-function nil
              echo-keystrokes 1
              enable-recursive-minibuffers nil
              erc-autoaway-idle-seconds 600
              erc-autojoin-timing 'ident erc-fill-prefix " "
              erc-insert-timestamp-function 'erc-insert-timestamp-left
              erc-interpret-mirc-color t
              erc-kill-buffer-on-part t
              erc-kill-queries-on-quit t
              erc-kill-server-buffer-on-quit t
              erc-prompt (lambda () (concat "[" (buffer-name) "]"))
              erc-prompt-for-password nil
              erc-query-display 'buffer
              erc-server-coding-system '(utf-8 . utf-8)
              erc-timestamp-format "%H:%M:%S "
              erc-timestamp-only-if-changed-flag nil
              erc-try-new-nick-p nil
              eshell-banner-message ""
              eshell-cd-on-directory t
              eshell-cmpl-autolist t
              eshell-cmpl-cycle-completions t
              eshell-cmpl-cycle-cutoff-length 2
              eshell-cp-interactive-query t
              eshell-cp-overwrite-files nil
              eshell-default-target-is-dot t
              eshell-destroy-buffer-when-process-dies t
              eshell-highlight-prompt t
              eshell-hist-ignoredups t
              eshell-history-size 10000
              eshell-buffer-maximum-lines 100000
              eshell-list-files-after-cd t
              eshell-ln-interactive-query t
              eshell-mv-interactive-query t
              eshell-output-filter-functions '(eshell-handle-ansi-color
                                               eshell-handle-control-codes
                                               eshell-watch-for-password-prompt
                                               eshell-truncate-buffer)
              eshell-plain-echo-behavior nil
              eshell-review-quick-commands t
              eshell-rm-interactive-query nil
              eval-expression-print-length 20
              eval-expression-print-level nil
              explicit-shell-args '("-c" "export EMACS= INSIDE_EMACS=; stty echo; shell")
              expand-region-contract-fast-key "j"
              fill-column 79
              flycheck-check-syntax-automatically '(save
                                                    idle-change
                                                    mode-enabled
                                                    new-line)
              flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list
              flycheck-idle-change-delay 0.001
              flycheck-standard-error-navigation nil
              flycheck-global-modes '(not erc-mode
                                          message-mode
                                          git-commit-mode
                                          view-mode
                                          outline-mode
                                          text-mode
                                          org-mode)
              flyspell-abbrev-p nil
              flyspell-auto-correct nil
              flyspell-highlight-properties nil
              flyspell-incorrect-hook nil
              flyspell-issue-welcome-flag nil
              global-auto-revert-non-file-buffers t
              highlight-nonselected-windows nil
              history-delete-duplicates t
              history-length 20000
              hippie-expand-verbose nil
              iedit-toggle-key-default nil
              imenu-auto-rescan t
              indicate-empty-lines t
              indent-tabs-mode nil
              inhibit-startup-screen t
              inhibit-startup-echo-area-message t
              ispell-extra-args '("--sug-mode=ultra")
              ispell-silently-savep t
              ispell-quietly t
              jit-lock-defer-time 0
              js2-mode-show-parse-errors nil
              js2-mode-show-strict-warnings nil
              kill-do-not-save-duplicates t
              kill-whole-line nil
              load-prefer-newer t
              magit-log-auto-more t
              magit-clone-set-remote.pushDefault t
              magit-ediff-dwim-show-on-hunks t
              magit-fetch-arguments nil
              magit-process-popup-time 15
              magit-stage-all-confirm nil
              magit-unstage-all-confirm nil
              mmm-global-mode 'buffers-with-submode-classes
              mmm-submode-decoration-level 2
              minibuffer-prompt-properties '(read-only t
                                                       cursor-intangible t
                                                       face minibuffer-prompt)
              next-error-recenter t
              notmuch-show-logo nil
              nrepl-log-messages t
              nsm-save-host-names t
              ns-function-modifier 'hyper
              ns-pop-up-frames nil
              org-export-in-background nil
              org-log-done 'time
              org-log-done-with-time t
              org-return-follows-links t
              org-special-ctrl-a/e t
              org-src-fontify-natively t
              org-src-preserve-indentation t
              org-src-tab-acts-natively t
              parens-require-spaces t
              projectile-globally-ignored-files '("TAGS"
                                                  "GPATH"
                                                  "GTAGS"
                                                  "GRTAGS")
              projectile-enable-caching t
              projectile-ignored-project-function 'file-remote-p
              projectile-switch-project-action 'projectile-dired
              projectile-do-log nil
              projectile-verbose nil
              reb-re-syntax 'string
              require-final-newline t
              resize-mini-windows t
              ring-bell-function 'ignore
              rtags-completions-enabled t
              rtags-imenu-syntax-highlighting 10
              ruby-insert-encoding-magic-comment nil
              sh-guess-basic-offset t
              same-window-buffer-names '("*eshell*" "*shell*" "*mail*"
                                         "*inferior-lisp*" "*ielm*" "*scheme")
              save-abbrevs 'silently
              save-interprogram-paste-before-kill t
              savehist-additional-variables '(search-ring
                                              regexp-search-ring
                                              kill-ring
                                              comint-input-ring)
              savehist-autosave-interval 60
              auto-window-vscroll nil
              hscroll-margin 5
              hscroll-step 5
              scroll-preserve-screen-position 'always
              send-mail-function 'smtpmail-send-it
              sentence-end-double-space t
              set-mark-command-repeat-pop t
              shell-completion-execonly nil
              shell-input-autoexpand nil
              sp-autoskip-closing-pair 'always
              tab-always-indent 'complete
              term-input-autoexpand t
              term-input-ignoredups t
              term-input-ring-file-name t
              tramp-default-proxies-alist '(((regexp-quote (system-name)) nil nil)
                                            (nil "\\`root\\'" "/ssh:%h:")
                                            (".*" "\\`root\\'" "/ssh:%h:"))
              tramp-default-user nil
              text-quoting-style 'grave
              tls-checktrust t
              undo-limit 80000
              uniquify-after-kill-buffer-p t
              use-dialog-box nil
              use-file-dialog nil
              use-package-enable-imenu-support t
              use-package-expand-minimally nil
              version-control t
              view-read-only t
              view-inhibit-help-message t
              visiable-bell nil
              visible-cursor t
              woman-imenu t
              whitespace-line-column 80
              whitespace-auto-cleanup t
              whitespace-rescan-timer-time nil
              whitespace-silent t)

(provide 'init-defaults)
;;; init-defaults.el ends here
