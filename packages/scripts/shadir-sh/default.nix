{ pkgs, ... }:

pkgs.writeScriptBin "shadir" ''
#!${pkgs.bash}/bin/bash

exec ${pkgs.findutils}/bin/find "$1" -type f -exec ${pkgs.coreutils}/bin/sha256sum {} > check.sha256 \;
''
