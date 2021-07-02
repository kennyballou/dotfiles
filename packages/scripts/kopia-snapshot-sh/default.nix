{ pkgs, ... }:

pkgs.writeScriptBin "kopia-snapshot.sh" ''
#!${pkgs.bash}/bin/bash

exec ${pkgs.coreutils}/bin/cat "$HOME/.config/kopia/targets" | \
     ${pkgs.findutils}/bin/xargs --no-run-if-empty ${pkgs.kopia}/bin/kopia snapshot create
''
