(define-module (kbg services config pdfpc)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (gnu home services))

(define-public pdfpc-config-service
  (list (simple-service 'pdfpc-config
                        home-files-service-type
                        `((".config/pdfpc/pdfpcrc"
                           ,(mixed-text-file "pdfprc" (string-join (list "option pointer-color #268bd2") "\n")))))))
