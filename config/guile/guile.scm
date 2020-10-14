(use-modules (ice-9 readline))
(use-modules (ice-9 pretty-print))
(activate-readline)

(define (pp . args)
  "Display (pretty-print) args, following each with a newline."
  (for-each (lambda (arg) (pretty-print arg)) args))
