{ lib, stdenv, fetchFromGitHub, pkgs, ... }:

stdenv.mkDerivation {
  name = "backup.sh";
  src = fetchFromGitHub {
    owner = "devnulllabs";
    repo = "backup.sh";
    rev = "148faec5275d1ed59275810dad2f3d16652bbf42";
    sha256 = "1hpi7n7rwkhgnx41l6iskj1b0m1jy1zs9xyis39zk1shmp4599fw";
  };

  buildInputs = with pkgs; [ bash ];

  installPhase = ''
    mkdir -p $out/bin
    install backup.sh $out/bin/backup.sh
  '';

  meta = {
    description = "Simple Backup Script";
    homepage = "https://github.com/devnulllabs/backup.sh";
    license = lib.licenses.gpl3Plus;
    maintainers = [];
    platforms = pkgs.lib.platforms.all;
  };
}
