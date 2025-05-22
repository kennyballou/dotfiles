(use-modules (guix channels))

(list (channel
       (name 'guix)
       (url "https://codeberg.org/guix/guix-mirror")
       (branch "master")
       (commit
        "471fc515c8bb015841d098aa7988c5718efa67cb")
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
        "595c2155a61ef7e552269cb1c569a33e3ec32bb2")
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
        "6274b1629e7b07040ec0c5ad5002dc6951837963")
       (introduction
        (make-channel-introduction
         "b9d0b8041d28ebd9f85cb041aa3f2235c8b39417"
         (openpgp-fingerprint
          "10F4 14AB D526 0D0E 2372  8C08 FE55 890B 57AE DCE5"))))
      (channel
       (name 'emacs)
       (url "https://github.com/garrgravarr/guix-emacs.git")
       (branch "master")
       (commit
        "53f05863234a62a1140181b9a87e09f91f7a34d4")
       (introduction
        (make-channel-introduction
         "d676ef5f94d2c1bd32f11f084d47dcb1a180fdd4"
         (openpgp-fingerprint
          "2DDF 9601 2828 6172 F10C  51A4 E80D 3600 684C 71BA")))))
