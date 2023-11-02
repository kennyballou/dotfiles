(define-module (systems axo)
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
  #:use-module (gnu services docker)
  #:use-module (gnu services linux)
  #:use-module (gnu services mcron)
  #:use-module (gnu services networking)
  #:use-module (gnu services nix)
  #:use-module (gnu services pm)
  #:use-module (gnu services security-token)
  #:use-module (gnu services virtualization)
  #:use-module (gnu services xorg)
  #:use-module (gnu system nss)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages printers)
  #:use-module (nongnu system linux-initrd)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles laptop)
  #:use-module (kbg services desktop)
  #:use-module (kbg services dict)
  #:use-module (kbg services nftables)
  #:use-module (kbg services boltd)
  #:use-module ((kbg system mcron) :prefix mcron:)
  #:use-module (kbg system xorg))

(define axo-system
  (operating-system
   (kernel linux)
   (kernel-arguments '("mem_sleep_default=deep nvme.noacpi=1 i915.enable_psr=1 modprobe.blacklist=hid_sensor_hub"))
   (kernel-loadable-modules
    (list v4l2loopback-linux-module))
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "axo")
   (timezone "America/Boise")
   (locale "en_US.utf8")

   (initrd-modules (append (list "dm-crypt") %base-initrd-modules))

   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (mapped-devices
    (list (mapped-device
           (source (uuid "f1e8d842-1c63-4311-803d-938f31d48d49"))
           (target "luks-f1e8d842-1c63-4311-803d-938f31d48d49")
           (type luks-device-mapping))
          (mapped-device
           (source "vg0")
           (targets (list "vg0-guix"
                          "vg0-home"
                          "vg0-nix"
                          "vg0-root"
                          "vg0-swap"
                          "vg0-tmp"
                          "vg0-var"))
           (type lvm-device-mapping))))

   (file-systems (append
                  (list (file-system
                         (device "/dev/mapper/vg0-root")
                         (mount-point "/")
                         (type "ext4")
                         (needed-for-boot? #t)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-guix")
                         (mount-point "/gnu")
                         (type "xfs")
                         (needed-for-boot? #t)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-nix")
                         (mount-point "/nix")
                         (type "xfs")
                         (needed-for-boot? #f)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-var")
                         (mount-point "/var")
                         (type "ext4")
                         (needed-for-boot? #t)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-tmp")
                         (mount-point "/tmp")
                         (type "ext4")
                         (needed-for-boot? #t)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-opt")
                         (mount-point "/opt")
                         (type "ext4")
                         (needed-for-boot? #f)
                         (dependencies mapped-devices))
                        (file-system
                         (device "/dev/mapper/vg0-home")
                         (mount-point "/home")
                         (type "xfs")
                         (needed-for-boot? #t)
                         (dependencies mapped-devices))
                        (file-system
                         (device (uuid "5A5D-20AF" 'fat))
                         (mount-point "/boot/efi")
                         (type "vfat")
                         (dependencies mapped-devices)))
                  %base-file-systems))

   (swap-devices (list (swap-space (target "/dev/mapper/vg0-swap")
                                   (discard? #f)
                                   (dependencies mapped-devices))))

   (users (cons (user-account
                 (name "kb")
                 (group "users")
                 (supplementary-groups '("audio"
                                         "input"
                                         "kvm"
                                         "libvirt"
                                         "lp"
                                         "netdev"
                                         "tty"
                                         "video"
                                         "wheel")))
                %base-user-accounts))

   ;; This is where we specify system-wide packages.
   (packages (append %kbg-base-packages
                     %kbg-bare-desktop-packages
                     %kbg-laptop-packages
                     %base-packages))

   ;; Add GNOME and Xfce---we can choose at the log-in screen
   ;; by clicking the gear.  Use the "desktop" services, which
   ;; include the X11 log-in service, networking with
   ;; NetworkManager, and more.
   (services (append (list (service gnome-desktop-service-type)
                           (service gnome-keyring-service-type)
                           (service boltd-service-type)
                           (service bluetooth-service-type
                                    (bluetooth-configuration
                                     (name "axo")))
                           (service cups-service-type
                                    (cups-configuration
                                     (web-interface? #t)))
                           dictionary-service
                           (set-xorg-configuration
                            (xorg-configuration
                             (keyboard-layout keyboard-layout)
                             (extra-config (list %xorg-libinput-config))))
                           (service nix-service-type
                                    (nix-configuration
                                     (sandbox #t)
                                     (extra-config '("trusted-users = root kb"))))
                           (service pcscd-service-type)
                           (service earlyoom-service-type)
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     (cpu-scaling-governor-on-bat (list "powersave"))
                                     ;; (cpu-scaling-min-freq-on-ac  2400000)
                                     ;; (cpu-scaling-min-freq-on-bat 1200000)
                                     (cpu-boost-on-ac? #t)
                                     (cpu-boost-on-bat? #f)
                                     (energy-perf-policy-on-ac "performance")
                                     (energy-perf-policy-on-bat "powersave")
                                     (pcie-aspm-on-ac "performance")
                                     (pcie-aspm-on-bat "powersupersave")
                                     (start-charge-thresh-bat0 70)
                                     (start-charge-thresh-bat1 70)
                                     (stop-charge-thresh-bat0 95)
                                     (stop-charge-thresh-bat1 95)))
                           (nftables-service "axo")
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list mcron:guix-gc-repair-job))
                           (service singularity-service-type)
                           (service virtlog-service-type
                                    (virtlog-configuration))
                           (service libvirt-service-type
                                    (libvirt-configuration
                                     (unix-sock-group "libvirt")
                                     (listen-tls? #f)
                                     (listen-tcp? #f)
                                     (min-workers 1)))
                           (service tor-service-type
                                    (tor-configuration))
                           (simple-service 'subordinate-ids
                                           special-files-service-type
                                           `(("/etc/subuid" ,(mixed-text-file "subuid"
                                                                              "kb:100000:65536"
                                                                              "\n"))
                                             ("/etc/subgid" ,(mixed-text-file "subgid"
                                                                              "kb:100000:65536"
                                                                              "\n")))))
                     %kbg-desktop-services))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)))

axo-system
