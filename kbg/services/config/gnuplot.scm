(define-module (kbg services config gnuplot)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (kbg packages gnuplot)
  #:use-module (gnu home services))

(define (gnuplot-config-text)
  (mixed-text-file "gnuplot"
                   "set loadpath '" gnuplot-colorbrewer "/diverging/' "
                   "'" gnuplot-colorbrewer "/qualitative/' "
                   "'" gnuplot-colorbrewer "/sequential/'"))

(define-public gnuplot-config-service
  (list (simple-service 'gnuplot-config
                        home-files-service-type
                        `((".gnuplot" ,(gnuplot-config-text))))))
