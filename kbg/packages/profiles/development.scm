(define-module (kbg packages profiles development)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages)
  #:use-module (gnu packages autogen)
  #:use-module (gnu packages base)
  #:use-module (gnu packages code)
  #:use-module (gnu packages containers)
  #:use-module (gnu packages graphviz)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages guile)
  #:use-module (gnu packages haskell-apps)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages java)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages patchutils)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages racket)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages search)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:export (%kbg-base-development-packages))

(define %kbg-base-development-packages
  (list
   autogen
   darcs
   diffstat
   diffutils
   direnv
   docx2txt
   dos2unix
   dot2tex
   git
   `(,git "gui")
   `(,git "send-email")
   `(,git "svn")
   `(,git "subtree")
   global
   groff
   guile-3.0
   highlight
   ltrace
   iperf
   gnu-make
   mercurial
   mg
   patch
   patchutils
   ;; perf
   podman
   python-wrapper
   racket
   rtags
   shellcheck
   socat
   source-highlight
   sqlite
   strace
   subversion
   tokei
   vim))
