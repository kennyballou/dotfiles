{ pkgs, ... }:
with pkgs; [
  (pass.withExtensions (ext: with ext; [ pass-otp pass-genphrase ]))
  ag
  alacritty
  apg
  aria2
  ario
  aspell
  aspellDicts.en
  aspellDicts.en-computers
  aspellDicts.en-science
  backup-sh
  bash-completion
  bashInteractive
  breezy
  cacert
  catdocx
  chromium
  coq
  ddcutil
  diffstat
  diffutils
  direnv
  ditaa
  dnsutils
  docbook5
  dos2unix
  dot2tex
  duplicity
  duplicity-backup-sh
  eclipses.eclipse-java
  element-desktop
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
  gen-sshconfig-sh
  getmail
  gimp
  git-tools
  global
  gnugrep
  gnupg
  gnuplot
  gnused
  gnutar
  gnutls
  graphviz-nox
  groff
  guile
  guile-lint
  hammer
  highlight
  htmlTidy
  htop
  httperf
  imagemagick
  imgcat
  inkscape.out
  install-git-hooks-sh
  iotop
  isync
  jetbrains.idea-community
  jitsi-meet-electron
  jmeter
  john
  jq
  kitty
  klavaro
  kopia
  ledger
  less
  libreoffice
  librsvg
  mc
  mercurial
  mitmproxy
  mkpasswd
  mpc_cli
  mpd
  mpdris2
  msmtp
  mtr
  multimarkdown
  mu
  mutt
  ncmpcpp
  niv
  nix-tools
  nix-search-emacs-packages-sh
  nmap
  notmuch
  nox
  obs-studio
  octaveFull
  openjdk11
  openssh
  openssl
  openvpn
  p7zip
  pandoc
  paperkey
  parallel
  patch
  patchutils
  pdfpc
  pdftk
  pidgin-with-plugins
  plantuml
  playerctl
  poppler_utils
  postman
  pv
  pwgen
  python-environment
  qrencode
  (rWrapper.override{ packages = with rPackages; [ ggplot2 dplyr xts ]; })
  racket
  ranger
  renameutils
  ripgrep
  rsync
  rtags
  screen
  shadir-sh
  shellcheck
  shreddir-sh
  signal-desktop
  silver-searcher
  slack
  socat
  sourceHighlight
  stow
  subversion
  svg2tikz
  tcpdump
  time
  tmux
  tokei
  tree
  units
  unzip
  urlwatch
  vale
  vim
  #visualvm
  w3m
  watch
  watchman
  wavemon
  wget
  whois
  wireshark-qt
  wkhtmltopdf
  wordnet
  xbindkeys
  xorg.xev
  xorriso
  xournal
  xsensors
  xsv
  xz
  youtube-dl
  yubikey-personalization
  z3
  zeal
  zip
  zoom-us
  zotero
  zsh
  zsh-syntax-highlighting
]
