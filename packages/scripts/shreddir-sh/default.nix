{ pkgs, ... }:

pkgs.writeScriptBin "shreddir" ''
#!${pkgs.bash}/bin/bash

if [ "$1" = "" ]; then
  echo "I'm not comfortable doing this..."
  exit 1
fi

${pkgs.findutils}/bin/find "$1" -type f -print -exec ${pkgs.coreutils}/bin/shred -zu {} \;
rm -rf $1

''
