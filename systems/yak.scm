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
  #:use-module (gnu services ssh)
  #:use-module (gnu services xorg)
  #:use-module (gnu system nss)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
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
  #:use-module (kbg system setuid-programs)
  #:use-module ((kbg system mcron) :prefix mcron:)
  #:use-module (kbg system xorg))

(define install-grub-efi-removable
  #~(lambda (bootloader efi-dir mount-point)
      (when efi-dir
        (let ((grub-install (string-append bootloader "/sbin/grub-install"))
              (install-dir (string-append mount-point "/boot"))
              (target-esp (if (file-exists? (string-append mount-point efi-dir))
                              (string-append mount-point efi-dir)
                              efi-dir)))
          (invoke/quiet grub-install "--boot-directory" install-dir
                        "--efi-directory" target-esp
                        "--removable")))))

(define grub-efi-removable
  (bootloader
   (inherit grub-efi-bootloader)
   (installer install-grub-efi-removable)))

(define yak-system
  (operating-system
   (kernel linux-lts)
   (kernel-loadable-modules
    (list v4l2loopback-linux-module))
   (firmware (list linux-firmware))
   (initrd microcode-initrd)
   (host-name "yak")
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
                         (device (uuid "acc24667-d071-48dc-81f7-b077e838b29f"))
                         (mount-point "/")
                         (type "ext4"))
                        (file-system
                         (device (uuid "EAB6-6000" 'fat))
                         (mount-point "/boot/efi")
                         (type "vfat"))
                        (file-system
                         (device (uuid "1ca489ef-8d04-40a5-bd1c-a5ee9333a27a"))
                         (mount-point "/home")
                         (type "xfs")))
                  %base-file-systems))

   ;; uuid=47b44fb7-4f6f-4ef5-bb17-2c509a80bc52
   (swap-devices (list (swap-space (target "/swapfile"))))

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
                           (service cups-service-type
                                    (cups-configuration
                                     (web-interface? #t)
                                     (extensions
                                      (list cups-filters hplip-minimal splix))))
                           (set-xorg-configuration
                            (xorg-configuration
                             (keyboard-layout keyboard-layout)
                             (extra-config (list %xorg-libinput-config))))
                           (service nix-service-type)
                           (service pcscd-service-type)
                           (service tlp-service-type
                                    (tlp-configuration
                                     (cpu-scaling-governor-on-ac (list "performance"))
                                     ;; (cpu-scaling-min-freq-on-ac  2400000)
                                     (cpu-boost-on-ac? #t)
                                     (energy-perf-policy-on-ac "performance")
                                     (pcie-aspm-on-ac "performance")))
                           (service openssh-service-type
                                    (openssh-configuration
                                     (x11-forwarding? #f)
                                     (password-authentication? #f)
                                     (permit-root-login 'prohibit-password)))
                           (nftables-service "yak")
                           (simple-service 'my-cron-jobs
                                           mcron-service-type
                                           (list mcron:guix-gc-repair-job)))
                     %kbg-desktop-services))

   ;; Allow resolution of '.local' host names with mDNS.
   (name-service-switch %mdns-host-lookup-nss)

   (setuid-programs (append %kb-setuid-programs
                            %setuid-programs))))

yak-system
