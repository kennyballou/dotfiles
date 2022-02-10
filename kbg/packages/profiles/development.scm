(define-module (kbg packages profiles development)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages)
  #:use-module (gnu packages autogen)
  #:use-module (gnu packages base)
  #:use-module (gnu packages code)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages java)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages parallel)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim))

(export %kbg-base-development-packages)

(define %kbg-base-development-packages
  (list
   ;; autogen
   diffstat
   diffutils
   dos2unix
   git
   global
   groff
   ltrace
   iperf
   gnu-make
   mg
   openjdk11
   parallel
   patch
   patchutils
   perf
   strace
   vim))
