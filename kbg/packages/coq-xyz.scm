(define-module (kbg packages coq-xyz)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages coq)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages multiprecision)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages python)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages texinfo)
  #:use-module (gnu)
  #:use-module (guix build utils)
  #:use-module (guix build-system dune)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system ocaml)
  #:use-module (guix build-system)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((srfi srfi-1) #:hide (zip))
  #:export (coq-math-classes))

(define coq-math-classes
  (let ((baseurl "https://github.com/coq-community/math-classes/archive/refs/tags/")
        (version "8.15.0"))
    (package
     (name "coq-math-classes")
     (version "8.15.0")
     (source (origin
              (method url-fetch)
              (uri (string-append baseurl version ".tar.gz"))
              (file-name (string-append "math-classes-" version ".tar.gz"))
              (sha256
               (base32
                "0gcq2d0v4jqkfyx408bclcs64i8ycvr1wfddxlqxah2d7n97k89x"))))
     (build-system gnu-build-system)
     (native-inputs
      (list coq ocaml ocamlbuild ocaml-findlib))
     (inputs
      (list coq-bignums))
     (arguments
      `(#:tests? #f
                 #:make-flags (list (string-append "COQLIBINSTALL="
                                                   (assoc-ref %outputs "out")
                                                   "/lib/coq/user-contrib"))
                 #:phases
                 (modify-phases %standard-phases
                                (delete 'configure))))
     (home-page "https://math-classes.github.io/")
     (synopsis "A library of abstract interfaces for mathematical structures in Coq")
     (description "Math classes is a library of abstract interfaces for
mathematical structures.")
     (license license:expat))))
