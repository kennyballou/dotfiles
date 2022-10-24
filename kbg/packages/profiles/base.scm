(define-module (kbg packages profiles base)
  #:use-module (guix)
  #:use-module (guix utils)
  #:use-module (gnu)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages code)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cryptsetup)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages disk)
  #:use-module (gnu packages entr)
  #:use-module (gnu packages file)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages groff)
  #:use-module (gnu packages idutils)
  #:use-module (gnu packages less)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lsof)
  #:use-module (gnu packages mc)
  #:use-module (gnu packages ncdu)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages nfs)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages parallel)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pv)
  #:use-module (gnu packages rsync)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages screen)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages shells)
  #:use-module (gnu packages shellutils)
  #:use-module (gnu packages sync)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages text-editors)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages time)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages tmux)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages vpn)
  #:use-module (gnu packages w3m)
  #:use-module (gnu packages web)
  #:use-module (gnu packages wget)
  #:use-module (gnu system nss)
  #:use-module (nongnu packages linux)
  #:export (%kbg-base-packages))

(define %kbg-base-packages
  (list bash-completion
        bindfs
        cpufrequtils
        cryptsetup
        curl
        entr
        ethtool
        fd
        fdisk
        file
        findutils
        fzf
        gawk
        gnupg
        gnutls
        gptfdisk
        grep
        groff
        gvfs
        htop
        iotop
        iperf
        jq
        less
        lsof
        ltrace
        mc
        mg
        mosh
        mtr
        ncdu
        nfs-utils
        nethogs
        net-tools
        nmap
        nss-certs
        openssh
        openssl
        parallel
        pciutils
        progress
        pv
        pwgen
        rclone
        renameutils
        ripgrep
        rsync
        screen
        sed
        smartmontools
        socat
        stow
        tar
        tcpdump
        time
        tmux
        tree
        unzip
        util-linux
        w3m
        wget
        which
        whois
        wireguard-tools
        xfsprogs
        xz
        zip))
