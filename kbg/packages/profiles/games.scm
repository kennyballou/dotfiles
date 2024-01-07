(define-module (kbg packages profiles games)
  #:use-module (gnu packages emulators)
  #:use-module (nongnu packages game-client)
  #:export (%kbg-games-packages
            %kbg-emulator-packages))

(define %kbg-games-packages
  (list steam))

(define %kbg-emulator-packages
  (list dolphin-emu
        mupen64plus-audio-sdl
        mupen64plus-core
        mupen64plus-video-glide64mk2
        mupen64plus-video-glide64
        mupen64plus-ui-console
        mupen64plus-input-sdl))
