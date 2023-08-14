(define-module (kbg packages profiles desktop)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages browser-extensions)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages code)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages entr)
  #:use-module (gnu packages finance)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnome-xyz)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages hardware)
  #:use-module (gnu packages haskell-xyz)
  #:use-module (gnu packages image)
  #:use-module (gnu packages inkscape)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages libreoffice)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mail)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages mpd)
  #:use-module (gnu packages music)
  #:use-module (gnu packages package-management)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages pdf)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages textutils)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages video)
  #:use-module (gnu packages uml)
  #:use-module (gnu packages web)
  #:use-module (gnu packages web-browsers)
  #:use-module (gnu packages wordnet)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (nongnu packages linux)
  #:use-module (nongnu packages mozilla)
  #:use-module (nongnu packages printers)
  #:export (%kbg-desktop-packages
            %kbg-bare-desktop-packages))

(define %kbg-bare-desktop-packages
  (list fontconfig
        gstreamer
        gst-plugins-bad
        gst-plugins-base
        gst-plugins-good
        gst-plugins-ugly
        hplip-plugin
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-utils
        xev
        xkill
        xf86-input-libinput
        xorg-server-xwayland))

(define %kbg-desktop-packages
  (list aria2
        aspell
        aspell-dict-en
        borg
        bash-completion
        ;; calibre
        enchant
        entr
        exiv2
        ffmpeg
        firefox/wayland
        flatpak
        fontconfig
        freecad
        fzf
        gawk
        getmail
        gimp
        gnome-shell-extension-gsconnect
        gnome-tweaks
        gnupg
        gnutls
        go-github-com-errata-ai-vale
        inkscape
        isync
        icecat
        kitty
        ledger
        libreoffice
        librsvg
        mpdris2
        mpd-mpc
        mpd
        msmtp
        mu
        mutt
        notmuch
        ncmpcpp
        nyxt
        obs
        okular
        p7zip
        pandoc
        paperkey
        papirus-icon-theme
        password-store
        pdfpc
        picard
        plantuml
        playerctl
        poppler
        qpdf
        qrencode
        ublock-origin/chromium
        ungoogled-chromium
        vlc
        units
        wavemon
        wordnet
        wofi
        yubikey-personalization
        xbindkeys
        xorriso
        xournal
        xsensors
        zeal))
