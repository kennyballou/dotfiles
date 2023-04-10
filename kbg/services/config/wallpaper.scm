(define-module (kbg services config wallpaper)
  #:use-module (kbg)
  #:use-module (gnu)
  #:use-module (guix)
  #:use-module (gnu packages kde-plasma)
  #:use-module (gnu home services))

(define-public wallpaper-config-service
  (list (simple-service 'wallpaper-config
                        home-files-service-type
                        `((".local/share/wallpapers"
                           ,(file-append plasma-workspace-wallpapers "/share/wallpapers"))))))
