(define-module (systems daeva)
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
  #:use-module (gnu services xorg)
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
  #:use-module (kbg system xorg))

(define nix-gc-job
  #~(job '(next-hour '(1))
         "nix-collect-garbage --delete-old"
         "nix garbage collection"))

(define guix-gc-repair-job
  #~(job '(next-hour '(0))
         "guix gc --verify=contents,repair"
         "guix store repair"))

(define garbage-collector-job
  #~(job "5 0 * * 0"
         "guix gc --collect-garbage"
         "guix garbage collection"))

(define install-grub-efi-removable
  #~(lambda (bootloader efi-dir mount-point)
      (when efi-dir
        (let ((grub-install (string-append bootloader "/sbin/grub-install"))
              (install-dir (string-append mount-point "/boot"))
              (target-esp (if (file-exists? (string-append mount-point efi-dir))
                              (string-append mount-point efi-dir)
                              efi-dir)))
          (setenv "GRUB_ENABLE_CRYPTODISK" "y")
          (invoke/quiet grub-install "--boot-directory" install-dir
                        "--efi-directory" target-esp
                        "--removable")))))

(define grub-efi-removable
  (bootloader
   (inherit grub-efi-bootloader)
   (installer install-grub-efi-removable)))

(define daeva-system
  (operating-system
   (kernel linux)
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "daeva")
   (timezone "America/Boise")
   (locale "en_US.utf8")

   (initrd-modules (append (list "dm-raid" "raid1")
                           %base-initrd-modules))

   (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

   (bootloader (bootloader-configuration
                (bootloader grub-efi-removable)
                (targets '("/boot/efi"))
                (keyboard-layout keyboard-layout)))

   (mapped-devices
    (list (mapped-device
           (source (list "/dev/nvme0n1p1" "/dev/nvme1n1p1"))
           (target "/dev/md126")
           (type raid-device-mapping))
          (mapped-device
           (source (list "/dev/nvme0n1p2" "/dev/nvme1n1p2"))
           (target "/dev/md127")
           (type raid-device-mapping))
          (mapped-device
           (source (uuid "e2690af0-3fa8-4d6c-bccc-d534ce418e20"))
           (target "luks-e2690af0-3fa8-4d6c-bccc-d534ce418e20")
           (type luks-device-mapping))))

   (file-systems (append
                  (list (file-system
                         ;; (device (uuid "16ced1b2-3e7f-4d04-a34e-b10ff033f67b"))
                         (device "/dev/mapper/luks-e2690af0-3fa8-4d6c-bccc-d534ce418e20")
                         (mount-point "/")
                         (type "ext4")
                         (dependencies mapped-devices))
                        (file-system
                         ;; (device (uuid "F134-4F4E" 'fat))
                         (device "/dev/md126")
                         (mount-point "/boot/efi")
                         (type "vfat")
                         (dependencies mapped-devices)))
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

   ;; Add GNOME and Xfce---we can choose at the log-in screen
   ;; by clicking the gear.  Use the "desktop" services, which
   ;; include the X11 log-in service, networking with
   ;; NetworkManager, and more.
   (services (append (list (service gnome-desktop-service-type
                            (gnome-desktop-configuration
                             (gnome gnome-sans-ssh-agent)))
                           ;;(geoclue-service)
                           (bluetooth-service #:auto-enable? #t)
                           (service cups-service-type)
                           (set-xorg-configuration
                            (xorg-configuration
                             (keyboard-layout keyboard-layout)
                             (extra-config (list %xorg-libinput-config))))
                           (service nix-service-type)
                           (service pcscd-service-type)
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     (cpu-scaling-governor-on-bat (list "powersave"))
                                     (cpu-scaling-min-freq-on-ac  2400000)
                                     (cpu-scaling-min-freq-on-bat 1200000)
                                     (cpu-boost-on-ac? #t)
                                     (cpu-boost-on-bat? #f)
                                     (energy-perf-policy-on-ac "performance")
                                     (energy-perf-policy-on-bat "powersave")
                                     (pcie-aspm-on-ac "performance")
                                     (pcie-aspm-on-bat "powersupersave")))
                           (nftables-service "daeva")
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list ;; garbage-collector-job
                                                 guix-gc-repair-job
                                                 nix-gc-job)))
                     %kbg-desktop-services))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)))

daeva-system
