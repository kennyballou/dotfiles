(list (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (commit
          "93d257c3cb23b1b3777d4cecf138dfc37f123f9a")
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
          "4399c012e4bb5460c1807285ed98fb5455816f8c")
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
          "a5da35c59a056000bfb16a7a5f3301472fc2fdf2")
        (introduction
          (make-channel-introduction
            "a5da35c59a056000bfb16a7a5f3301472fc2fdf2"
            (openpgp-fingerprint
              "B74C C4B4 1148 C3DB 364B  C211 82D9 4B35 744E 1B34"))))
      (channel
        (name 'emacs)
        (url "https://github.com/babariviere/guix-emacs.git")
        (branch "master")
        (commit
          "014b733624d3915eee6c62c4e57ff23706c22306")
        (introduction
          (make-channel-introduction
            "8d45521e2aeac063fba926d375b1a202c5487275"
            (openpgp-fingerprint
              "3625 EE6E E04C 2179 AF71  6983 A09D 60B1 44D1 75FE")))))
