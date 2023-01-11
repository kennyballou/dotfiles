(define-module (kbg services config aspell)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (kbg packages aspell)
  #:use-module (gnu packages aspell)
  #:use-module (gnu home services))

(define (aspell-config-text)
  (mixed-text-file "aspell.conf"
                   "lang en_US"
                   "\n"
                   "dict-dir " aspell-dict-en "/lib/aspell"
                   "\n"
                   "add-extra-dicts " aspell-dict-en-computers "/lib/aspell/en-computers.rws"
                   "\n"
                   "add-extra-dicts " aspell-dict-en-science "/lib/aspell/en_US-science.rws"
                   "\n"))

(define-public aspell-config-service
  (list (simple-service 'aspell-config
                        home-files-service-type
                        `((".config/aspell/aspell.conf"
                           ,(aspell-config-text))))))
