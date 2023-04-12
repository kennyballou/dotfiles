(define-module (kbg packages profiles science)
  #:use-module (gnu packages coq)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages parallel)
  #:use-module (kbg packages coq-xyz)
  #:use-module (kbg packages gwl)
  #:export (%kbg-science-packages))

(define %kbg-science-packages
  (list
   coq
   coq-mathcomp
   coq-math-classes
   coq-semantics
   coq-stdpp
   gnuplot
   graphviz
   gwl
   octave
   parallel
   z3))
