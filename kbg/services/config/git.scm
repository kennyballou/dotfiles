(define-module (kbg services config git)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define (git-file fname)
  (string-append ".config/git/" fname))

(define-public git-config-service
  (list (simple-service 'git-config
                        home-files-service-type
                        `((,(git-file "config")
                           ,(local-file (string-append %dotfiles-root "config/git/git/config")))
                          (,(git-file "global-ignore")
                           ,(local-file (string-append %dotfiles-root "config/git/git/global-ignore")))
                          (,(git-file "gitk")
                           ,(local-file (string-append %dotfiles-root "config/git/git/gitk")))
                          (,(git-file "attributes")
                           ,(local-file (string-append %dotfiles-root "config/git/git/attributes")))
                          (,(git-file "template.d")
                           ,(local-file (string-append %dotfiles-root "config/git/git/template.d")
                                        #:recursive? #t))))))
