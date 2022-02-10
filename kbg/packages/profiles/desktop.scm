(define-module (kbg packages profiles desktop)
  #:use-module (gnu build chromium-extension)
  #:use-module (gnu packages aspell)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages bittorrent)
  #:use-module (gnu packages chromium)
  #:use-module (gnu packages code)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages ebook)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages entr)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages gimp)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gnuzilla)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mpd)
  #:use-module (gnu packages music)
  ;; #:use-module (gnu packages package-management)
  #:use-module (gnu packages password-utils)
  #:use-module (gnu packages security-token)
  #:use-module (gnu packages terminals)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages video)
  #:use-module (gnu packages web)
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
        xdg-utils
        xev
        xkill
        xf86-input-libinput
        xorg-server-xwayland))

(define %kbg-desktop-packages
  (list aria2
        aspell-dict-en
        borg
        bash-completion
        calibre
        entr
        exiv2
        ffmpeg
        firefox/wayland
        fontconfig
        ;; freecad
        fzf
        gawk
        gimp
        gnome-tweaks
        gnupg
        gnutls
        icecat
        kitty
        mpd-mpc
        mpd
        ncmpcpp
        okular
        password-store
        picard
        ;; ublock-origin-chromium
        ungoogled-chromium/wayland
        vlc
        wordnet
        wofi
        yubikey-personalization))
