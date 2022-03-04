(define-module (kbg packages gnuplot)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix build utils)
  #:use-module (guix build-system)
  #:use-module (guix build-system copy)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:export (gnuplot-colorbrewer))

(define gnuplot-colorbrewer
  (let ((baseurl "https://github.com/aschn/gnuplot-colorbrewer/archive/refs/tags/")
        (version "1.0"))
    (package
     (name "gnuplot-colorbrewer")
     (version version)
     (source (origin
              (method url-fetch)
              (uri (string-append baseurl version ".tar.gz"))
              (file-name (string-append "gnuplot-colorbrewer-" version ".tar.gz"))
              (sha256
               (base32
                "0rynzrvsp55v1hwrkzjysjzznwghac8xgawg48py5zrx52c6yh2g"))))
     (build-system copy-build-system)
     (arguments
      '(#:install-plan '(("diverging/" "diverging")
                         ("sequential/" "sequential")
                         ("qualitative/" "qualitative"))))
     (synopsis "ColorBrewer color schemes for gnuplot")
     (description "ColorBrewer color schemes usable by gnuplot")
     (home-page "https://github.com/aschn/gnuplot-colorbrewer")
     (license license:asl2.0))))
