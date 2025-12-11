(define-module (kbg channels)
  #:use-module (guix channels)
  #:export (%kbg-channels))

(define %kbg-channels
  (list (channel
         (name 'guix)
         (url "https://codeberg.org/guix/guix")
         (branch "master")
         (commit
          "21f0be1aa341dd2cb6722a069375030e714fc046")
         (introduction
          (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
            "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
        (channel
         (name 'nonguix)
         (url "https://gitlab.com/nonguix/nonguix")
         (branch "master")
         (commit
          "53c477b3e0a45b3bd0036647ac805a8f5e8f71d0")
         (introduction
          (make-channel-introduction
           "ca0837cc70d5b4d3fce83b34c31b3378f60f4498"
           (openpgp-fingerprint
            "8141 6036 E81A 5CF7 8F80  1071 ECFC 8398 8B4E 4B9F"))))
        (channel
         (name 'kbg)
         (url "https://git.sr.ht/~kennyballou/guix-channel.git")
         (branch "trunk")
         (commit
          "d52068de2c5b1e6570a7f91ce34301ab2a9be03e")
         (introduction
          (make-channel-introduction
           "b9d0b8041d28ebd9f85cb041aa3f2235c8b39417"
           (openpgp-fingerprint
            "10F4 14AB D526 0D0E 2372  8C08 FE55 890B 57AE DCE5"))))))

%kbg-channels
