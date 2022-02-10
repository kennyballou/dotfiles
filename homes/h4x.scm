(define-module (homes h4x)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (gnu services)
  #:use-module (guix gexp)
  #:use-module (gnu home services)
  #:use-module (gnu home services fontutils)
  #:use-module (gnu home services mcron)
  #:use-module (gnu home services shells)
  #:use-module (gnu home services shepherd)
  #:use-module (gnu home services symlink-manager)
  #:use-module (gnu home services xdg)
  #:use-module (kbg)
  #:use-module (kbg packages profiles base)
  #:use-module (kbg packages profiles development)
  #:use-module (kbg packages profiles desktop)
  #:use-module (kbg packages profiles fonts)
  #:use-module (kbg packages emacs)
  #:use-module (kbg services emacs)
  #:use-module (kbg services shell)
  #:use-module (kbg services xdg))

(home-environment
 (packages
  (append ;; %kbg-base-packages
   %kbg-fonts
   %kbg-base-development-packages
   %kbg-desktop-packages
   (map (compose list specification->package+output)
        (list "aria2"
              "aspell"
              "aspell-dict-en"
              "bash-completion"
              "coq"
              "diffstat"
              "diffutils"
              "direnv"
              ;; "ditaa"
              ;; "docbook-xml"
              "docx2txt"
              "dos2unix"
              "dot2tex"
              "enchant"
              "entr"
              "exiv2"
              "fd"
              "ffmpeg"
              "file"
              "findutils"
              "firefox"
              "flatpak"
              "fontconfig"
              "fzf"
              "gawk"
              "getmail"
              "gimp"
              "git"
              "global"
              "grep"
              "gnupg"
              "gnuplot"
              "sed"
              "tar"
              "gnutls"
              "go-github-com-errata-ai-vale"
              "graphviz"
              "groff"
              "guile"
              ;; "hammer"
              "highlight"
              ;; "htmlTidy"
              "htop"
              ;; "httperf"
              "icecat"
              "imagemagick"
              ;; "imgcat"
              "inkscape"
              "iotop"
              "isync"
              ;; "jmeter"
              "jq"
              "kitty"
              "ledger"
              "less"
              "libreoffice"
              "librsvg"
              "mc"
              "mercurial"
              ;; "mitmproxy"
              "mpc"
              "mpd"
              "mpdris2"
              "msmtp"
              "mtr"
              "mu"
              ;; "multimarkdown"
              "mutt"
              "ncmpcpp"
              "nmap"
              "notmuch"
              "obs"
              "octave"
              ;; "openjdk11"
              "openssh"
              "openssl"
              "openvpn"
              "p7zip"
              "pandoc"
              "paperkey"
              "parallel"
              "patch"
              "patchutils"
              "pdfpc"
              ;; "pdftk"
              "plantuml"
              "playerctl"
              "poppler"
              ;; "postman"
              "pv"
              "pwgen"
              "python"
              "qrencode"
              "r"
              "racket"
              "ranger"
              "renameutils"
              "ripgrep"
              "rsync"
              "rtags"
              "screen"
              "shellcheck"
              "socat"
              "source-highlight"
              "sqlite"
              "stow"
              "subversion"
              ;; "svg2tikz"
              "tcpdump"
              "time"
              "tmux"
              "tokei"
              "tree"
              "units"
              "unzip"
              ;; "urlwatch"
              "wavemon"
              "wget"
              "whois"
              "wordnet"
              "xbindkeys"
              "xev"
              "xorriso"
              "xournal"
              "xsensors"
              "xz"
              "yubikey-personalization"
              "z3"
              "zeal"
              "zip"
              ;; "zotero"
              ))))

 (services
  (append bash-service emacs-service xdg-service)))

