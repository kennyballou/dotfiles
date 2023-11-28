(define-module (kbg packages profiles fonts)
  #:use-module (gnu packages fonts))

(export %kbg-fonts)

(define %kbg-fonts
  (list font-adobe-source-code-pro
        font-awesome
        font-bitstream-vera
        font-dejavu
        font-google-noto
        font-google-noto-emoji
        font-google-noto-sans-cjk
        font-google-noto-serif-cjk
        font-hack
        font-inconsolata
        font-ipa-mj-mincho
        font-liberation))

