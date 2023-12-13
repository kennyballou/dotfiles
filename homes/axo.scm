(define-module (homes axo)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu services audio)
  #:use-module (gnu home services)
  #:use-module (gnu home services desktop)
  #:use-module (gnu home services fontutils)
  #:use-module (gnu home services mcron)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu home services xdg)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles development)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles fonts)
  #:use-module (kbg packages profiles games)
  #:use-module (kbg packages profiles science)
  #:use-module (kbg packages profiles statistics)
  #:use-module (kbg services config dotfiles)
  #:use-module (kbg services emacs)
  #:use-module (kbg services pipewire)
  #:use-module (kbg services shell)
  #:use-module (kbg services shepherd)
  #:use-module (nongnu packages mozilla))

(home-environment
 (packages
  (append %kbg-base-development-packages
          (filter-packages (list) %kbg-desktop-packages)
          %kbg-science-packages
          %kbg-statistics-packages
          %kbg-fonts))

 (services
  (append bash-service
          (configs-for-host 'axo)
          emacs-service
          (list (service home-mcron-service-type))
          (list (service home-dbus-service-type)
                (service home-pipewire-service-type))
          (services-for-host 'axo))))
          ;; shepherd-user-services
