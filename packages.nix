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
  bash-completion
  bashInteractive
  breezy
  cacert
  chromium
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
  gen-sshconfig-sh
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
  jmeter
  john
  jq
  klavaro
  ledger
  less
  libreoffice
  librsvg
  mercurial
  mitmproxy
  mkpasswd
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
  pdftk
  pidgin-with-plugins
  plantuml
  poppler_utils
  proselint
  pv
  pwgen
  python-environment
  qrencode
  racket
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
  vim
  visualvm
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
