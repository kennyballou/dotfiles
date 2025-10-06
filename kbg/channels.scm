(define-module (kbg channels)
  #:use-module (guix channels)
  #:export (%kbg-channels))

(define %kbg-channels
  (list (channel
         (name 'guix)
         (url "https://codeberg.org/guix/guix")
         (branch "master")
         (commit
          "c0d172278b66f4c55ce9eb07874439a7b48db395")
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
          "150e5e5b63d70ed92783965b22617a8c7f4da369")
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
          "2c70c07218a982c87aae466c37ff485bfbe6dce2")
         (introduction
          (make-channel-introduction
           "b9d0b8041d28ebd9f85cb041aa3f2235c8b39417"
           (openpgp-fingerprint
            "10F4 14AB D526 0D0E 2372  8C08 FE55 890B 57AE DCE5"))))))

%kbg-channels
