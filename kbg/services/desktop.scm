(define-module (kbg services desktop)
  #:use-module (gnu services)
  #:use-module (gnu services base)
  #:use-module (gnu services desktop)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages networking)
  #:use-module (gnu services networking)
  #:use-module (gnu services xorg)
  #:use-module (gnu packages vpn)
  #:export (%kbg-desktop-services))

(define %kbg-desktop-services
  (modify-services %desktop-services
                   (network-manager-service-type config =>
                                                 (network-manager-configuration
                                                  (inherit config)
                                                  (vpn-plugins (list network-manager-openvpn
                                                                     network-manager-vpnc
                                                                     network-manager-openconnect))))
                   (gdm-service-type config =>
                                     (gdm-configuration
                                      (inherit config)
                                      (wayland? #t)))))
