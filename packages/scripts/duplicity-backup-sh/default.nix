{ pkgs, ... }:

pkgs.writeScriptBin "duplicity-backup.sh" ''
#!${pkgs.bash}/bin/bash

exec ${pkgs.duplicity}/bin/duplicity --full-if-older-than 1M \
     --encrypt-key 932F3E8E1C0F4A9895D7B8B8B0CAA28A02958308 \
     --include-filelist "${builtins.getEnv "HOME"}/.config/duplicity/includes" \
     --rsync-options "--bwlimit=2048K" \
     / \
     rsync://usw-s008.rsync.net/backup/kb/$(hostname)/duplicity
''
