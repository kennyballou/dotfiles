{ pkgs, ... }:
with pkgs; [
  (pass.withExtensions (ext: with ext; [ pass-otp pass-genphrase ]))
  ag
  alacritty
  apg
  aria2
  aspell
  aspellDicts.en
  aspellDicts.en-computers
  aspellDicts.en-science
  autogen
  bash-completion
  bashInteractive
  beam-environment
  breezy
  cacert
  chromium
  diffstat
  diffutils
  ditaa
  dnsutils
  docbook5
  dos2unix
  dot2tex
  duplicity
  direnv
  elm-environment
  emacs-overlay
  enchant
  entr
  exiv2
  fd
  ffmpeg
  file
  findutils
  firefox
  fontconfig
  fonts-overlay
  fzf
  gawk
  ghc-environment
  gimp
  git-tools
  global
  gnugrep
  gnumake
  gnupg
  gnuplot
  gnused
  gnutar
  gnutls
  golang-environment
  graphviz-nox
  groff
  hammer
  highlight
  htmlTidy
  htop
  httperf
  imagemagick
  imgcat
  inkscape.out
  iotop
  isync
  john
  jq
  js-environment
  jvm-environment11
  klavaro
  ledger
  less
  libreoffice
  librsvg
  mercurial
  mitmproxy
  mkpasswd
  ml-environment
  mpc_cli
  mpd
  msmtp
  mtr
  mu
  ncmpcpp
  nix-tools
  nmap
  notmuch
  octave
  openssh
  openssl
  openvpn
  p7zip
  pandoc
  paperkey
  parallel
  patch
  patchutils
  pdftk
  php-environment
  plantuml
  poppler_utils
  pv
  pwgen
  python-environment
  qrencode
  r-environment
  renameutils
  ripgrep
  rsync
  rtags
  scheme-environment
  screen
  shellcheck
  silver-searcher
  slack
  socat
  sourceHighlight
  stow
  subversion
  svg2tikz
  tcpdump
  texFull
  time
  tmux
  tokei
  tree
  unzip
  urlwatch
  vim
  w3m
  watch
  watchman
  wavemon
  wget
  whois
  wireshark-qt
  wordnet
  xbindkeys
  wkhtmltopdf
  xorg.xev
  xorriso
  xsensors
  xsv
  xz
  youtube-dl
  yubikey-personalization
  zip
  zoom-us
  zotero
  zsh
  zsh-syntax-highlighting
]
