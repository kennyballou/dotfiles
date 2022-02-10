(define-module (kbg packages profiles fonts)
  #:use-module (gnu packages fonts))

(export %kbg-fonts)

(define %kbg-fonts
  (list font-adobe-source-code-pro
	font-bitstream-vera
	font-dejavu
	font-google-noto
	font-hack
	font-inconsolata
	font-ipa-mj-mincho
	font-liberation))

