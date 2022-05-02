(define-module (systems koi)
  #:use-module (guix)
  #:use-module (guix records)
  #:use-module (guix utils)
  #:use-module (gnu)
  #:use-module (gnu packages)
  #:use-module (gnu services avahi)
  #:use-module (gnu services base)
  #:use-module (gnu services cups)
  #:use-module (gnu services dbus)
  #:use-module (gnu services desktop)
  #:use-module (gnu services linux)
  #:use-module (gnu services mcron)
  #:use-module (gnu services networking)
  #:use-module (gnu services nix)
  #:use-module (gnu services pm)
  #:use-module (gnu services security-token)
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:use-module (gnu system file-systems)
  #:use-module (gnu system nss)
  #:use-module (gnu packages gnome)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages printers)
  #:use-module (nongnu system linux-initrd)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages gnome)
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
     ("timeo" . "600"))))

(define koi-system
  (operating-system
   (kernel linux-lts)
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "koi")
   (timezone "America/Boise")
   (locale "en_US.utf8")

   (initrd-modules (append (list "dm-raid" "raid1")
                           %base-initrd-modules))

   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (mapped-devices
    (list (mapped-device
           (source (list "/dev/sda1" "/dev/sdb1"))
           (target "/dev/md1")
           (type raid-device-mapping))
          (mapped-device
           ;; (source "/dev/md1")
           (source (uuid "4808204d-0116-4234-b931-6cc6161d5f3b"))
           (target "luks-4808204d-0116-4234-b931-6cc6161d5f3b")
           (type luks-device-mapping))
          (mapped-device
           (source (uuid "ddb3da26-ac44-4f4a-b01a-6b21967df63d"))
           ;; (source "/dev/nvme0n1p2")
           (target "luks-ddb3da26-ac44-4f4a-b01a-6b21967df63d")
           (type luks-device-mapping))))

   (file-systems (append
                  (list (file-system
                         (device "/dev/mapper/luks-ddb3da26-ac44-4f4a-b01a-6b21967df63d")
                         (mount-point "/")
                         (type "ext4")
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/luks-4808204d-0116-4234-b931-6cc6161d5f3b")
                         (mount-point "/home")
                         (type "xfs")
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/media/kb/documents")
                         (device "baal:/srv/documents")
                         (type "nfs4")
                         (mount-may-fail? #t)
                         (mount? #t)
                         (create-mount-point? #t)
                         (options nfs-mount-options)
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/media/kb/downloads")
                         (device "baal:/srv/downloads")
                         (type "nfs4")
                         (mount-may-fail? #t)
                         (mount? #t)
                         (create-mount-point? #t)
                         (options nfs-mount-options)
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/media/kb/music")
                         (device "baal:/srv/music")
                         (type "nfs4")
                         (mount-may-fail? #t)
                         (mount? #t)
                         (create-mount-point? #t)
                         (options nfs-mount-options)
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/media/kb/pictures")
                         (device "baal:/srv/pictures")
                         (type "nfs4")
                         (mount-may-fail? #t)
                         (mount? #t)
                         (create-mount-point? #t)
                         (options nfs-mount-options)
                         (dependencies mapped-devices))
                        (file-system
                         (mount-point "/media/kb/videos")
                         (device "baal:/srv/videos")
                         (type "nfs4")
                         (mount-may-fail? #t)
                         (mount? #t)
                         (create-mount-point? #t)
                         (options nfs-mount-options)
                         (dependencies mapped-devices))
                        (file-system
                         (device (uuid "C08E-E6C4" 'fat32))
                         (mount-point "/boot/efi")
                         (type "vfat")))
                  %base-file-systems))

   (swap-devices (list (swap-space (target "/swapfile")
                                   (dependencies mapped-devices))))

   (users (cons (user-account
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
                %base-user-accounts))

   ;; This is where we specify system-wide packages.
   (packages (append %kbg-base-packages
                     %kbg-bare-desktop-packages
                     %base-packages))

   (services (append (list (service gnome-desktop-service-type
                                    (gnome-desktop-configuration
                                     (gnome gnome-sans-ssh-agent)))
                           (service cups-service-type
                                    (cups-configuration
                                     (web-interface? #t)))
                           (set-xorg-configuration
                            (xorg-configuration
                             (keyboard-layout keyboard-layout)
                             (extra-config (list %xorg-libinput-config))))
                           (service nix-service-type)
                           (service pcscd-service-type)
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     (cpu-scaling-min-freq-on-ac  3200000)
                                     (cpu-boost-on-ac? #t)
                                     (energy-perf-policy-on-ac "performance")
                                     (pcie-aspm-on-ac "performance")))
                           (service openssh-service-type
                                    (openssh-configuration
                                     (x11-forwarding? #f)
                                     (password-authentication? #f)
                                     (permit-root-login 'prohibit-password)))
                           (nftables-service "koi")
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list mcron:guix-gc-repair-job
                                                 mcron:updatedb-job)))
                     %kbg-desktop-services))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)))

koi-system
