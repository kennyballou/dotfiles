(define-module (kbg services desktop)
  #:use-module (kbg)
  #:use-module (guix)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages networking)
  #:use-module (gnu services networking)
  #:use-module (gnu services sound)
  #:use-module (gnu services xorg)
  #:use-module (gnu packages vpn)
  #:export (%kbg-desktop-services))

(define %kbg-desktop-services
  (modify-services %desktop-services
                   (guix-service-type config =>
                                      (guix-configuration
                                       (inherit config)
                                       (substitute-urls
                                        (append %default-substitute-urls
                                                (list "https://substitutes.nonguix.org"
                                                      "https://substitutes.guix.pyschonotebook.org")))
                                       (authorized-keys
                                        (append %default-authorized-guix-keys
                                                (list (local-file (string-append %dotfiles-root
                                                                                 "keys/guix/substitutes.nonguix.org.pub"))
                                                      (local-file (string-append %dotfiles-root
                                                                                 "keys/guix/substitutes.guix.psychonotebook.org.pub")))))))
                   (network-manager-service-type config =>
                                                 (network-manager-configuration
                                                  (inherit config)
                                                  (vpn-plugins (list network-manager-openvpn
                                                                     network-manager-vpnc
                                                                     network-manager-openconnect))))
                   (gdm-service-type config =>
                                     (gdm-configuration
                                      (inherit config)
                                      (wayland? #t)))
                   (delete pulseaudio-service-type)))
