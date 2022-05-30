(define-module (kbg packages profiles games)
  #:use-module (gnu packages emulators)
  #:export (%kbg-games))

(define %kbg-games
  (list dolphin-emu
        mupen64plus-audio-sdl
        mupen64plus-core
        mupen64plus-video-glide64mk2
        mupen64plus-video-glide64
        mupen64plus-ui-console
        mupen64plus-input-sdl))
