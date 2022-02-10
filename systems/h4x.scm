;; This is an operating system configuration template
;; for a "desktop" setup with GNOME and Xfce where the
;; root partition is encrypted with LUKS, and a swap file.

(use-modules (guix)
             (guix utils)
             (gnu)
             (gnu system nss)
             (nongnu packages linux)
             (nongnu packages mozilla)
             (nongnu packages printers)
             (nongnu system linux-initrd))
(use-service-modules avahi
                     base
                     cups
                     dbus
                     desktop
                     linux
                     mcron
                     networking
                     nix
                     security-token
                     xorg)
(use-package-modules admin
                     aspell
                     base
                     bash
                     bittorrent
                     bootloaders
                     certs
                     code
                     compression
                     cryptsetup
                     cups
                     disk
                     ebook
                     emacs
                     engineering
                     entr
                     file
                     fontutils
                     fonts
                     freedesktop
                     gawk
                     gimp
                     gnome
                     gnupg
                     graphviz
                     groff
                     gstreamer
                     idutils
                     image
                     kde
                     less
                     libusb
                     linux
                     lsof
                     music
                     ncdu
                     networking
                     nfs
                     package-management
                     password-utils
                     patchutils
                     parallel
                     pciutils
                     pv
                     rsync
                     rust-apps
                     security-token
                     ssh
                     shells
                     shellutils
                     sync
                     terminals
                     textutils
                     time
                     tls
                     tmux
                     version-control
                     video
                     vim
                     vpn
                     w3m
                     web
                     wget
                     wordnet
                     xorg)

(define garbage-collector-job
  #~(job "5 0 * * *"
         "guix gc -F 1G"))

(operating-system
 ;; (kernel linux)
 ;; (firmware linux-firmware)
 (initrd microcode-initrd)
 (host-name "h4x")
 (timezone "America/Boise")
 (locale "en_US.utf8")
 (keyboard-layout (keyboard-layout "us" #:options '("ctrl:nocaps")))

 (bootloader (bootloader-configuration
              (bootloader grub-bootloader)
              (terminal-outputs '(console))
              (targets (list "/dev/disk/by-id/wwn-0x5002538e000c21b7"
                             "/dev/disk/by-id/wwn-0x5002538e40de02bf"))
              (keyboard-layout keyboard-layout)))

 (initrd-modules (append (list "dm-raid" "raid1")
                         %base-initrd-modules))

 (mapped-devices
  (list
   (mapped-device
    (source (list "/dev/sda2" "/dev/sdb2"))
    (target "/dev/md0")
    (type raid-device-mapping))
   (mapped-device
    (source (uuid "80e61014-c20d-428e-b7f2-c4dd206a3ade"))
    (target "luks-80e61014-c20d-428e-b7f2-c4dd206a3ade")
    (type luks-device-mapping))))

 (file-systems (append
                (list (file-system
                       (device (uuid "4bceee1a-23e3-484a-965c-04707e81b1f8"))
                       (mount-point "/")
                       (type "ext4")
                       (dependencies mapped-devices)))
                %base-file-systems))

 ;; Specify a swap file for the system, which resides on the
 ;; root file system.
 (swap-devices
  (list (swap-space
         (target "/swapfile")
         (dependencies mapped-devices))))

 (users (cons (user-account
               (name "kb")
               (password (crypt "alice" "$6$abc"))
               (group "users")
               (supplementary-groups '("wheel" "netdev"
                                       "audio" "video")))
              %base-user-accounts))

 ;; This is where we specify system-wide packages.
 (packages (append (list
                    aria2
                    aspell-dict-en
                    bash-completion
                    calibre
                    cryptsetup
                    diffstat
                    diffutils
                    dos2unix
                    dot2tex
                    emacs
                    entr
                    ethtool
                    exiv2
                    fd
                    fdisk
                    ffmpeg
                    file
                    findutils
                    firefox
                    font-dejavu
                    font-google-noto
                    fontconfig
                    ;; freecad
                    fzf
                    gawk
                    gimp
                    git
                    gnome-tweaks
                    gnupg
                    gnutls
                    gptfdisk
                    grep
                    groff
                    gstreamer
                    gst-plugins-bad
                    gst-plugins-base
                    gst-plugins-good
                    gst-plugins-ugly
                    gvfs
                    hplip
                    hplip-plugin
                    htop
                    iotop
                    iperf
                    jq
                    kcachegrind
                    kitty
                    less
                    lsof
                    ltrace
                    mtr
                    ncdu
                    nfs-utils
                    nmap
                    nss-certs
                    okular
                    openssh
                    openssl
                    parallel
                    patch
                    patchutils
                    pciutils
                    perf
                    picard
                    progress
                    pv
                    pwgen
                    rclone
                    renameutils
                    ripgrep
                    rsync
                    sed
                    smartmontools
                    socat
                    stow
                    strace
                    tar
                    tcpdump
                    time
                    tmux
                    tree
                    unzip
                    util-linux
                    vim
                    vlc
                    w3m
                    wget
                    which
                    whois
                    wireguard-tools
                    wordnet
                    xdg-utils
                    xev
                    xfsprogs
                    xkill
                    xz
                    yubikey-personalization
                    zip
                    zsh
                    zsh-syntax-highlighting)
                   %base-packages))

 ;; Add GNOME and Xfce---we can choose at the log-in screen
 ;; by clicking the gear.  Use the "desktop" services, which
 ;; include the X11 log-in service, networking with
 ;; NetworkManager, and more.
 (services (append (list (service gnome-desktop-service-type)
                         ;;(geoclue-service)
                         (service cups-service-type)
                         (set-xorg-configuration
                          (xorg-configuration
                           (keyboard-layout keyboard-layout)))
                         (service nix-service-type)
                         (service pcscd-service-type)
                         (simple-service 'my-cron-jobs
                                         mcron-service-type
                                         (list garbage-collector-job)))
                   %kbg-desktop-services))

 ;; Allow resolution of '.local' host names with mDNS.
 (name-service-switch %mdns-host-lookup-nss))
