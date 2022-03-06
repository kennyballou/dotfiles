(define-module (kbg packages nix-xyz)
  #:use-module (gnu)
  #:use-module (guix build utils)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module ((srfi srfi-1) #:hide (zip))
  #:export (nix-direnv))

(define nix-direnv
  (let ((baseurl "https://github.com/nix-community/nix-direnv/archive/refs/tags/")
        (version "1.6.0"))
    (package
     (name "nix-direnv")
     (version version)
     (source (origin
              (method url-fetch)
              (uri (string-append baseurl version ".tar.gz"))
              (file-name (string-append "nix-direnv-" version ".tar.gz"))
              (sha256
               (base32
                "149hs2xk56gsgwzkks9cbap36iz1l28whkwbnmb3fkffiqmrwvx0"))))
     (build-system copy-build-system)
     (arguments
      '(#:install-plan '(("direnvrc" "share/direnvrc"))))
     (synopsis "A faster, persistent implementation of `direnv's` `use_nix`, to replace the built-in one.")
     (description "A faster, persistent implementation of `direnv's` `use_nix`, to replace the built-in one.")
     (home-page "https://github.com/nix-community/nix-direnv")
     (license license:expat))))
