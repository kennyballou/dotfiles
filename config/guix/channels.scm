(use-modules (guix channels))

(list (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (branch "master")
       (commit
        "cd704d29ce9755a4ec5b9baf72ba7428ae3500a6")
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
        "944619c1947ba59823f4ad6d8b13842b7e162d76")
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
        "ced3f0ae0e2c2a1eab22081bc5c2d5d8209c7f91")
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
        "60a7cf1d17ee10131cb4d025297654ea16ad3d30")
       (introduction
        (make-channel-introduction
         "d676ef5f94d2c1bd32f11f084d47dcb1a180fdd4"
         (openpgp-fingerprint
          "2DDF 9601 2828 6172 F10C  51A4 E80D 3600 684C 71BA")))))
