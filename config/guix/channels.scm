(use-modules (guix channels))

(list (channel
       (name 'guix)
       (url "https://git.sr.ht/~kennyballou/guix.git")
       (branch "master")
       (commit
        "95879674c2312432f778383c2979fd0c9c098721")
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
        "71a53faf2e1925a309b480f17e5b836740ce54bc")
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
        "5dbe9f1b954e3c406d40980d7d46d1364fbc36e1")
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
        "c030db9f8108af80d93d1ff9174b633f2efe19da")
       (introduction
        (make-channel-introduction
         "8d45521e2aeac063fba926d375b1a202c5487275"
         (openpgp-fingerprint
          "3625 EE6E E04C 2179 AF71  6983 A09D 60B1 44D1 75FE")))))
