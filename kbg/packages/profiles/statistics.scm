(define-module (kbg packages profiles statistics)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages)
  #:use-module (gnu packages cran)
  #:use-module (gnu packages statistics)
  #:use-module (kbg packages statistics)
  #:export (%kbg-statistics-packages))

(define %kbg-statistics-packages
  (list
   r
   r-ascii
   r-dplyr
   r-ggplot2
   r-readr
   r-xtable
   r-xts))
