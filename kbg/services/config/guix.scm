(define-module (kbg services config guix)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (ice-9 textual-ports))

(define-public guix-config-service
  (let ((shell-auth-dirs (string-append %dotfiles-root "config/guix/shell-authorized-directories"))
        (shell-auth-dirs-template (string-append %dotfiles-root "config/guix/shell-authorized-directories.template")))
    (list (simple-service 'guix-config
                          home-files-service-type
                          `((".config/guix/channels.scm"
                             ,(local-file (string-append %dotfiles-root "config/guix/channels.scm")))
                            (".config/guix/shell-authorized-directories"
                             ,(plain-file "kb-shell-authorized-directories"
                                          (string-join (list (call-with-input-file shell-auth-dirs-template get-string-all)
                                                             (if (file-exists? shell-auth-dirs)
                                                                 (call-with-input-file shell-auth-dirs get-string-all)
                                                                 ""))
                                                       "\n"))
                             )
                            )
                          )
          )
    )
  )
