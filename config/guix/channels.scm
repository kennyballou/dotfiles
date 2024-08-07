(use-modules (guix channels))

(list (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
        "78d946b01162fbe986c6768800e8cfd6e70e67e5")
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
        "877ed8cc4eee26ddde3d7d200c19c370c6bf7cb1")
       (introduction
        (make-channel-introduction
         "ca0837cc70d5b4d3fce83b34c31b3378f60f4498"
         (openpgp-fingerprint
          "8141 6036 E81A 5CF7 8F80  1071 ECFC 8398 8B4E 4B9F"))))
      (channel
       (name 'kbg)
       (url "https://git.sr.ht/~kennyballou/guix-channel.git")
       (branch "master")
       (commit
        "0d8aada61480edc72d0cec7d8b3f931825004dab")
       (introduction
        (make-channel-introduction
         "b9d0b8041d28ebd9f85cb041aa3f2235c8b39417"
         (openpgp-fingerprint
          "10F4 14AB D526 0D0E 2372  8C08 FE55 890B 57AE DCE5"))))
      (channel
       (name 'emacs)
       (url "https://github.com/babariviere/guix-emacs.git")
       (branch "master")
       (commit
        "3a79ac763abea377089796f31a5f7f0738e78d5f")
       (introduction
        (make-channel-introduction
         "8d45521e2aeac063fba926d375b1a202c5487275"
         (openpgp-fingerprint
          "3625 EE6E E04C 2179 AF71  6983 A09D 60B1 44D1 75FE")))))
