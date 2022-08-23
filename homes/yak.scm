(define-module (homes yak)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu services audio)
  #:use-module (gnu home services)
  #:use-module (gnu home services fontutils)
  #:use-module (gnu home services mcron)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu home services xdg)
  #:use-module (gnu packages engineering)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles development)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles fonts)
  #:use-module (kbg packages profiles science)
  #:use-module (kbg packages profiles statistics)
  #:use-module (kbg services config dotfiles)
  #:use-module (kbg services emacs)
  #:use-module (kbg services mcron)
  #:use-module (kbg services shell)
  #:use-module (kbg services shepherd)
  #:use-module (nongnu packages mozilla))

(home-environment
 (packages
  (append %kbg-base-development-packages
          ;; firefox does not build on this machine
          ;; and we do not need freecad here
          (filter (lambda (p) (not (member p (list firefox/wayland freecad))))
                  %kbg-desktop-packages)
          %kbg-statistics-packages
          %kbg-science-packages
          %kbg-fonts))

 (services
  (append bash-service
          (configs-for-host 'yak)
          emacs-service
          ;; mcron-service
          (services-for-host 'yak))))
          ;; shepherd-user-services
