(define-module (kbg services config ssh)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services)
  #:use-module (kbg packages networking)
  #:use-module (ice-9 ftw)
  #:use-module (ice-9 textual-ports)
  #:export (ssh-config-service))

(define (read-to-string file)
  (call-with-input-file file get-string-all))

(define ssh-config-files
  (map (lambda (f) (string-append %dotfiles-root "config/ssh/ssh/config.d/" f))
       (scandir (string-append %dotfiles-root "config/ssh/ssh/config.d")
                (lambda (f) (string-contains f ".conf")))))

(define ssh-config-service
  (list (simple-service 'ssh-config
                        home-files-service-type
                        `((".ssh/isup"
                           ,(file-append isup "/bin/isup"))
                          (".ssh/config"
                           ,(plain-file "kb-ssh-config"
                                        (string-join (append (map read-to-string ssh-config-files)
                                                             (list (read-to-string (string-append
                                                                                    %dotfiles-root
                                                                                    "config/ssh/ssh/config"))))
                                                             "\n")))
                          (".ssh/authorized_keys"
                           ,(local-file (string-append %dotfiles-root "config/ssh/ssh/authorized_keys")))))))
