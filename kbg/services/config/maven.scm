(define-module (kbg services config maven)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (gnu packages java)
  #:use-module (gnu home services))

(define-public maven-config-service
  (list (simple-service 'maven-config
                        home-files-service-type
                        `((".m2/settings.xml"
                          ,(local-file (string-append %dotfiles-root "config/maven/settings.xml")))))))
