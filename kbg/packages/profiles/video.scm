(define-module (kbg packages profiles video)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages avahi)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crates-graphics)
  #:use-module (gnu packages dns)
  #:use-module (gnu packages fribidi)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages image)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages lua)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages ssh)
  #:use-module (gnu packages upnp)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages xorg)
  #:export (%kbg-video-codecs))

(define %kbg-video-codecs
  (list alsa-lib
        avahi
        dav1d
        flac
        ffmpeg
        fribidi
        liba52
        libarchive
        libass
        libavc1394
        libbluray
        libcaca
        libcddb
        libdca
        libdvbpsi
        libdvdnav
        libdvdread
        libebml
        libidn
        libkate
        libmad
        libmatroska
        libmicrodns
        libmodplug
        libmpeg2
        libogg
        libpng
        libraw1394
        libsamplerate
        libsecret
        libssh2
        libupnp
        libva
        libvdpau
        libvorbis
        libvpx
        libtheora
        libx264
        libxext
        libxi
        libxinerama
        libxml2
        libxpm
        livemedia-utils
        lua-5.2
        mesa
        opus
        perl
        pulseaudio
        protobuf
        sdl
        sdl-image
        speex
        speexdsp
        srt
        taglib
        twolame
        unzip
        x265))
