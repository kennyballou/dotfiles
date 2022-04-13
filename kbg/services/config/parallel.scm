(define-module (kbg services config parallel)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu home services))

(define-public parallel-config-service
  (list (simple-service 'parallel-config
                        home-files-service-type
                        `((".parallel/will-cite"
                           ,(mixed-text-file "will-cite" "\n"))))))
