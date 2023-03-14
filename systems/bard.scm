(define-module (systems bard)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (guix utils)
  #:use-module (gnu)
  #:use-module (gnu packages)
  #:use-module (gnu packages kodi)
  #:use-module (gnu services avahi)
  #:use-module (gnu services base)
  #:use-module (gnu services cups)
  #:use-module (gnu services dbus)
  #:use-module (gnu services desktop)
  #:use-module (gnu services lirc)
  #:use-module (gnu services linux)
  #:use-module (gnu services mcron)
  #:use-module (gnu services networking)
  #:use-module (gnu services nix)
  #:use-module (gnu services pm)
  #:use-module (gnu services security-token)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:use-module (gnu system nss)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages pulseaudio)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages printers)
  #:use-module (nongnu system linux-initrd)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles games)
  #:use-module (kbg packages profiles video)
  #:use-module (kbg services desktop)
  #:use-module (kbg services nftables)
  #:use-module ((kbg system mcron) :prefix mcron:)
  #:use-module (kbg system xorg))

(define nfs-mount-options
  (alist->file-system-options
   '("rw"
     "_netdev"
     "noauto"
     "exec"
     ("rsize" . "1048576")
     ("wsize" . "1048756")
     ("timeo" . "60"))))

(define bard-system
  (operating-system
   (kernel linux-lts)
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "bard")
   (timezone "America/Boise")
   (locale "en_US.utf8")

   (initrd-modules %base-initrd-modules)

   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (file-systems (append
                  (list (file-system
                          (device (uuid "5a0e26fe-8cc4-4ded-9bd9-9930228b6674"))
                          (mount-point "/")
                          (type "ext4"))
                        (file-system
                          (device (uuid "B7E7-D5B6" 'fat))
                          (mount-point "/boot/efi")
                          (type "vfat"))
                        (file-system
                          (mount-point "/media/kb/music")
                          (device "baal:/srv/music")
                          (type "nfs4")
                          (mount-may-fail? #t)
                          (mount? #f)
                          (create-mount-point? #t)
                          (options nfs-mount-options)
                          (dependencies '()))
                        (file-system
                          (mount-point "/media/kb/videos")
                          (device "baal:/srv/videos")
                          (type "nfs4")
                          (mount-may-fail? #t)
                          (mount? #f)
                          (create-mount-point? #t)
                          (options nfs-mount-options)
                          (dependencies '())))
                  %base-file-systems))

   ;; uuid=47b44fb7-4f6f-4ef5-bb17-2c509a80bc52
   (swap-devices (list (swap-space (target "/swapfile"))))

   (users (append (list (user-account
                         (name "kb")
                         (group "users")
                         (supplementary-groups '("audio"
                                                 "input"
                                                 "kvm"
                                                 "lp"
                                                 "netdev"
                                                 "tty"
                                                 "video"
                                                 "wheel")))
                        (user-account
                         (name "kodi")
                         (group "users")
                         (supplementary-groups '("audio"
                                                 "input"
                                                 "video"))))
                %base-user-accounts))

   (packages (append %kbg-base-packages
                     %kbg-bare-desktop-packages
                     %kbg-video-codecs
                     (list kodi
                           kodi-cli
                           pamixer
                           ponymix
                           pulseaudio
                           pulsemixer)
                     %base-packages))

   (services (append (list ;; (service gnome-desktop-service-type
                           ;;          (gnome-desktop-configuration
                           ;;           (gnome gnome-sans-ssh-agent)))
                           ;; (service xfce-desktop-service-type)
                           ;; (service mate-desktop-service-type)
                           ;; (service enlightenment-desktop-service-type)
                           (bluetooth-service #:auto-enable? #t)
                           (lirc-service)
                           (set-xorg-configuration
                            (xorg-configuration
                             (keyboard-layout keyboard-layout)
                             (extra-config (list %xorg-libinput-config))))
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     (cpu-scaling-min-freq-on-ac  1800000)
                                     (cpu-boost-on-ac? #t)
                                     (energy-perf-policy-on-ac "performance")
                                     (pcie-aspm-on-ac "performance")))
                           (service openssh-service-type
                                    (openssh-configuration
                                     (x11-forwarding? #f)
                                     (password-authentication? #t)
                                     (permit-root-login 'prohibit-password)))
                           (nftables-service "bard")
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list mcron:guix-gc-job
                                                 mcron:guix-gc-repair-job)))
                     (modify-services %kbg-desktop-services
                                      (gdm-service-type config =>
                                                        (gdm-configuration
                                                         (inherit config)
                                                         (auto-login? #t)
                                                         (default-user "kodi"))))))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)))

bard-system
