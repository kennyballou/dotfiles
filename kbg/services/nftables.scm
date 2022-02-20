(define-module (kbg services nftables)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu services networking)
  #:export (nftables-service))

(define (nftables-service hostname)
  (let ((nftrules-file (string-append %dotfiles-root
                                       "systems/"
                                       hostname
                                       "/nftables-rules.nft")))
    (service nftables-service-type
                 (nftables-configuration
                  (ruleset (local-file nftrules-file "nftables-rules.nft"))))))
